-- 该表单站点一年存储预估4T(30亿/月 * 12个月 * 10G/亿)
-- partition by list(country) then by timescaleDB, using foreign table
CREATE TABLE sku_history (
    country     country_type   NOT NULL,
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
COMMENT ON COLUMN sku_history.country IS '国家，如 ：ID TW VN TH PH MY SG';
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