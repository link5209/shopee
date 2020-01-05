-- 该表单站点一年存储预估4T(30亿/月 * 12个月 * 10G/亿)
-- eg:
-- DB: shopee_tw, PARTITION BY RANGE (create_time)
-- CREATE FOREIGN TABLE sku_history_pg01 INHERITS (sku_history);
-- CHECK ( create_time >= DATE '2006-02-01' AND create_time < DATE '2006-03-01' )
-- then by timescaleDB

CREATE TABLE sku_history (
    -- country     country_type   NOT NULL,
    product_id  bigint         NOT NULL,
    sku_id      bigint         NOT NULL,
    stock       int            NOT NULL,
    price       decimal(10, 2) NOT NULL,
    sold        int            NOT NULL,
    sold_1      int            NOT NULL,
    revenue     decimal(10,2)  NOT NULL,
    revenue_1   decimal(10,2)  NOT NULL,
    status      product_status NOT NULL,
    create_time timestamptz    NOT NULL DEFAULT now()
);

COMMENT ON TABLE sku_history IS 'sku历史记录(日更新)';
-- COMMENT ON COLUMN sku_history.country IS '国家，如 ：ID TW VN TH PH MY SG';
COMMENT ON COLUMN sku_history.product_id IS '产品ID，如：1711117483';
COMMENT ON COLUMN sku_history.sku_id IS '变体ID，如：1711117483';
COMMENT ON COLUMN sku_history.stock IS '当前库存数量';
COMMENT ON COLUMN sku_history.price IS '折后售价(该国货币)';
COMMENT ON COLUMN sku_history.sold IS '截止当日累计已售出';
COMMENT ON COLUMN sku_history.sold_1 IS '当日售出,eg: 3';
COMMENT ON COLUMN sku_history.revenue IS '截止当日累计销售额';
COMMENT ON COLUMN sku_history.revenue_1 IS '当日销售额';
COMMENT ON COLUMN sku_history.status IS 'available-已上架，unavailable-已下架，empty-已售罄';
COMMENT ON COLUMN sku_history.create_time IS '该条记录创建时间';

-- 保存sku信息到历史记录表
CREATE OR REPLACE FUNCTION save_sku_history() RETURNS trigger as $$
    DECLARE
        -- latest_row sku_history%rowtype;
        latest_row RECORD;
         -- 和最近一次更新时间比较相差的天数（正常为一日）
        gap int;
        -- 和最近一次更新时间比较的销售增量（可能大于一日）
        _sold_1 int;
        -- 计算每天平均的销售增量
        sold_1_avg int;
        -- 当日销量
        current_sold_1 int;
        -- 当日销售额增量
        current_revenue_growth int;
        -- 平均销售额增量（分摊到每个gap）
        revenue_growth_avg int;
    BEGIN
        -- get latest sku row
        latest_row := SELECT sold, create_time FROM sku_history
        WHERE product_id = NEW.product_id AND sku_id = NEW.sku_id
        -- AND create_time < NEW.update_time -- for constraint exclusion usage when sku_history changed to foreign table
        ORDER BY create_time DESC LIMIT 1;

        IF FOUND THEN
            -- cal gap between current date
            gap := SELECT (EXTRACT(epoch FROM NEW.create_time - latest_row.create_time)/3600/24)::int;
            IF (gap < 1) THEN RETURN END IF;

            _sold_1 := NEW.sold - latest_row.sold;
            sold_1_avg := _sold_1 / gap;
            revenue_growth_avg := sold_1_avg * NEW.price;
            IF (gap > 1) THEN
                FOR i IN 1..(gap-1) LOOP
                    INSERT INTO sku_history (product_id, sku_id, stock, price, sold, sold_1,
                        revenue, revenue_1, status)
                    VALUES (NEW.product_id, NEW.sku_id, NEW.stock-sold_1_avg, NEW.price,
                        NEW.sold+sold_1_avg, sold_1_avg, latest_row.revenue+revenue_growth_avg, revenue_growth_avg, NEW.status);
                END LOOP;
            END IF;

            -- 当日数据单独处理，因为sold_1_avg可能Double转Int后丢失精度
            current_sold_1 := _sold_1-(sold_1_avg*(gap-1));
            current_revenue_growth := current_sold_1 * NEW.price
            INSERT INTO sku_history (product_id, sku_id, stock, price, sold, sold_1,
                revenue, revenue_1, status)
            VALUES (NEW.product_id, NEW.sku_id, NEW.stock, NEW.price, NEW.sold, current_sold_1,
                latest_row.revenue+current_revenue_growth, current_revenue_growth, NEW.status);
        ELSE
            -- 该SKU第一次插入，不能计算增量数据，sold_1/revenue_1默认0
            INSERT INTO sku_history (product_id, sku_id, stock, price, sold, sold_1,
                revenue, revenue_1, status)
            VALUES (NEW.product_id, NEW.sku_id, NEW.stock, NEW.price, NEW.sold, 0,
                NEW.price*NEW.sold, 0, NEW.status);
        END IF;
    END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_sku_history BEFORE INSERT ON sku_history
    FOR EACH ROW EXECUTE FUNCTION save_sku_history();