CREATE TABLE product_history (
    product_id  bigint        NOT NULL,
    country     country_type  NOT NULL,
    sold        int           NOT NULL,
    sales       int           NOT NULL,
    revenue     decimal(10,2) NOT NULL,
    revenue_1   decimal(10,2) NOT NULL,
    stock       int           NOT NULL,
    reviews     int           NOT NULL,
    reviews_1   int           NOT NULL,
    likes       int           NOT NULL,
    likes_1     int           NOT NULL,
    catetory_id int           NOT NULL,
    shop_id     int           NOT NULL,
    create_time timestamptz   NOT NULL
);

COMMENT ON TABLE product_history IS '商品历史记录(日更新)';
COMMENT ON COLUMN product_history.product_id IS '产品ID，如：1711117483';
COMMENT ON COLUMN product_history.country IS '国家，如 ：ID TW VN TH PH MY SG';
COMMENT ON COLUMN product_history.sold IS '截止当日所有sku累计历史销量';
COMMENT ON COLUMN product_history.sales IS '当日所有sku总销量';
COMMENT ON COLUMN product_history.revenue IS '截止当日所有sku累计历史销售额';
COMMENT ON COLUMN product_history.revenue_1 IS '当日所有sku销售额';
COMMENT ON COLUMN product_history.stock IS '截止当日所有变体总库存数量';
COMMENT ON COLUMN product_history.reviews IS '截止当日累计评论总数';
COMMENT ON COLUMN product_history.reviews_1 IS '当日累计评论总数';
COMMENT ON COLUMN product_history.likes IS '截止当日累计点赞总数';
COMMENT ON COLUMN product_history.likes_1 IS '当日累计点赞总数';
COMMENT ON COLUMN product_history.catetory_id IS '直接类目ID';
COMMENT ON COLUMN product_history.shop_id IS '店铺ID';
COMMENT ON COLUMN product_history.create_time IS '记录创建时间';