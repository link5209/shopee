
CREATE TABLE sku (
    country     country_type   NOT NULL,
    product_id  bigint         NOT NULL,
    sku_id      bigint         NOT NULL,
    name        text           NOT NULL,
    stock       int            NOT NULL,
    price       decimal(10, 2) NOT NULL,
    sales       int            NOT NULL,
    status      product_status NOT NULL,
    create_time timestamptz    NOT NULL,
    update_time timestamptz    NOT NULL,
    UNIQUE(product_id, sku_id)
);

COMMENT ON TABLE sku IS '商品对应的sku列表';
COMMENT ON COLUMN sku.country IS '国家，如 ：ID TW VN TH PH MY SG';
COMMENT ON COLUMN sku.product_id IS '产品ID，如：1711117483';
COMMENT ON COLUMN sku.sku_id IS '变体ID，如：1711117483(所有站点sku_id唯一)';
COMMENT ON COLUMN sku.name IS 'eg:紅色,S';
COMMENT ON COLUMN sku.stock IS '当前库存数量';
COMMENT ON COLUMN sku.price IS '折后售价(该国货币)';
COMMENT ON COLUMN sku.sales IS '累计总销量';
COMMENT ON COLUMN sku.status IS 'available-已上架，unavailable-已下架，empty-已售罄';
COMMENT ON COLUMN sku.create_time IS '该条记录创建时间';
COMMENT ON COLUMN sku.update_time IS '该条记录更新时间';