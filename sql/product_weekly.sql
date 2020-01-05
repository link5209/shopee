CREATE TABLE product_weekly (
    product_id  bigint        NOT NULL,
    country     country_type  NOT NULL,
    sold        int           NOT NULL,
    revenue     decimal(10,2) NOT NULL,
    reviews     int           NOT NULL,
    likes       int           NOT NULL,
    catetory_id int           NOT NULL,
    shop_id     int           NOT NULL,
    first_day   date          NOT NULL,
    create_time timestamptz   NOT NULL
);

COMMENT ON TABLE product_weekly IS '商品自然周统计';
COMMENT ON COLUMN product_weekly.product_id IS '产品ID，如：1711117483';
COMMENT ON COLUMN product_weekly.country IS '国家，如 ：ID TW VN TH PH MY SG';
COMMENT ON COLUMN product_weekly.sold IS '当周所有sku累计销量';
COMMENT ON COLUMN product_weekly.revenue IS '当周所有sku累计销售额';
COMMENT ON COLUMN product_weekly.reviews IS '当周累计评论总数';
COMMENT ON COLUMN product_weekly.likes IS '当周累计点赞总数';
COMMENT ON COLUMN product_weekly.catetory_id IS '直接类目ID';
COMMENT ON COLUMN product_weekly.shop_id IS '店铺ID';
COMMENT ON COLUMN product_weekly.first_day IS '自然周第一天';
COMMENT ON COLUMN product_weekly.create_time IS '记录创建时间';