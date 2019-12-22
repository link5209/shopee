CREATE TABLE shop (
    shop_id           bigint        NOT NULL,
    country           country_type  NOT NULL,
    username          text          NOT NULL,
    name              text          NOT NULL,
    logo_url          text          NOT NULL,
    location          text          NOT NULL,
    preferred         bool          NOT NULL,
    is_official       bool          NOT NULL,
    item_count        int           NOT NULL,
    products_saled_30 int           NOT NULL,
    products_new_7    int           NOT NULL,
    categories        int           NOT NULL,
    sales_30          int           NOT NULL,
    sales_7           int           NOT NULL,
    sales_growth_30   int           NOT NULL,
    selling_rate_30   int           NOT NULL,
    revenue_30        decimal(10,2) NOT NULL,
    revenue_7         decimal(10,2) NOT NULL,
    rating            decimal(3,2)  NOT NULL,
    reviews_total     int           NOT NULL,
    reviews_30        int           NOT NULL,
    reviews_7         int           NOT NULL,
    cancellation_rate decimal(3,2)  NOT NULL,
    fans              int           NOT NULL,
    follows           int           NOT NULL,
    chat_rate         decimal(3,2)  NOT NULL,
    delivery_days     text          NOT NULL,
    join_time         timestamptz   NOT NULL,
    created_time      timestamptz   NOT NULL,
    update_time       timestamptz   NOT NULL
);

COMMENT ON TABLE shop IS '店铺信息';
COMMENT ON COLUMN shop.shop_id IS '店铺ID，如：28802775';
COMMENT ON COLUMN shop.country IS '国家，如：ID TW VN TH PH MY SG';
COMMENT ON COLUMN shop.username IS '店铺标识，如：rock82911';
COMMENT ON COLUMN shop.name IS '店铺名称，如：VOUGE 3C - 專營各式高品質手機平板鋼化玻璃保護貼';
COMMENT ON COLUMN shop.logo_url IS '店铺封面图片URL';
COMMENT ON COLUMN shop.location IS '店铺地址，如：新北市新莊區';
COMMENT ON COLUMN shop.join_time IS '开店日期，如：2019-08-02';
COMMENT ON COLUMN shop.preferred IS '是否是虾皮精选店铺，Y-是，N-否';
COMMENT ON COLUMN shop.is_official IS '是否是官方商城，Y-是，N-不是';
COMMENT ON COLUMN shop.item_count IS '当前产品数';
COMMENT ON COLUMN shop.products_saled_30 IS '最近30天有动销的产品数';
COMMENT ON COLUMN shop.products_new_7 IS '最近7天上新的产品数';
COMMENT ON COLUMN shop.categories IS '商品类目种数';
COMMENT ON COLUMN shop.sales_30 IS '最近30天店铺销量';
COMMENT ON COLUMN shop.sales_7 IS '最近7天店铺销量';
COMMENT ON COLUMN shop.sales_growth_30 IS '近30天销量增长率，如：0.54';
COMMENT ON COLUMN shop.selling_rate_30 IS '店铺近30天动销率，如：0.87';
COMMENT ON COLUMN shop.revenue_30 IS '最近30天店铺销售额';
COMMENT ON COLUMN shop.revenue_7 IS '最近7天店铺销售额';
COMMENT ON COLUMN shop.rating IS '店铺评分值，如：4.95';
COMMENT ON COLUMN shop.reviews_total IS '店铺评论总数，如：3901';
COMMENT ON COLUMN shop.reviews_30 IS '店铺最近30天新增评论数';
COMMENT ON COLUMN shop.reviews_7 IS '店铺最近7天新增评论数';
COMMENT ON COLUMN shop.cancellation_rate IS '店铺取消率，如：0.01';
COMMENT ON COLUMN shop.fans IS '店铺粉丝数';
COMMENT ON COLUMN shop.follows IS '关注中';
COMMENT ON COLUMN shop.chat_rate IS '聊聊表现，如：0.95';
COMMENT ON COLUMN shop.delivery_days IS '出货天数，如：1-3，5+';
COMMENT ON COLUMN shop.created_time IS '该条记录创建时间';
COMMENT ON COLUMN shop.update_time IS '记录更新时间';
