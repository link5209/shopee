CREATE TABLE product_monthly (
    product_id  bigint        NOT NULL,
    country     country_type  NOT NULL,
    sales       int           NOT NULL,
    revenue     decimal(10,2) NOT NULL,
    reviews     int           NOT NULL,
    likes       int           NOT NULL,
    catetory_id int           NOT NULL,
    shop_id     int           NOT NULL,
    first_day   date          NOT NULL,
    create_time timestamptz   NOT NULL
);

COMMENT ON TABLE product_monthly IS '商品自然月统计';
COMMENT ON COLUMN product_monthly.product_id IS '产品ID，如：1711117483';
COMMENT ON COLUMN product_monthly.country IS '国家，如 ：ID TW VN TH PH MY SG';
COMMENT ON COLUMN product_monthly.sales IS '当月所有sku累计销量';
COMMENT ON COLUMN product_monthly.revenue IS '当月所有sku累计销售额';
COMMENT ON COLUMN product_monthly.reviews IS '当月累计评论总数';
COMMENT ON COLUMN product_monthly.likes IS '当月累计点赞总数';
COMMENT ON COLUMN product_monthly.catetory_id IS '直接类目ID';
COMMENT ON COLUMN product_monthly.shop_id IS '店铺ID';
COMMENT ON COLUMN product_monthly.first_day IS '自然月第一天';
COMMENT ON COLUMN product_monthly.create_time IS '记录创建时间';