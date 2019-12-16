
-- CREATE TABLE product_daily
-- CREATE TABLE product_weekly
--   COMMENT ON COLUMN product.sales_growth_week IS '销量增长率-按周';
--   COMMENT ON COLUMN product.revenue_1 IS '最近1天销售额';

-- CREATE TABLE product_monthly


CREATE TYPE product_status AS ENUM (
  'available', -- 已上架
  'unavailable', -- 已下架
  'empty' -- 已售罄
);

CREATE TYPE country_type AS ENUM (
  'ID', -- Indonesia
  'TW', -- Taiwan
  'VN', -- Vietnam
  'TH', -- Thailand
  'PH', -- Philippines
  'MY', -- Malaysia
  'SG' -- Singapore
);

CREATE TABLE product (
  product_id bigint PRIMARY KEY NOT NULL,
  country    country_type NOT NULL,
  uri        text NOT NULL,
  name       text NOT NULL,
  image_url  text NOT NULL,
  brand      text,
  is_oversea bool NOT NULL,
  variations int  NOT NULL,
  status product_status NOT NULL,
  preferred bool NOT NULL,
  min_price decimal(10, 2) NOT NULL,
  max_price decimal(10, 2) NOT NULL,
  discount int NOT NULL,
  stock int NOT NULL,

  catetory_path_name text NOT NULL,
  catetory_path_en   text NOT NULL,
  catetory_path_id   text NOT NULL,

  shop_id    int  NOT NULL,
  shop_owner text NOT NULL,
  shop_name  text NOT NULL,
  location   text NOT NULL,
  
  sales_total       int NOT NULL,
  sales_30          int NOT NULL,
  sales_7           int NOT NULL,
  sales_growth_30   int NOT NULL,
  sales_trend_30    int[] NOT NULL,
  sales_trend_month int[] NOT NULL,

  revenue_30        decimal(10,2) NOT NULL,
  revenue_7         decimal(10,2) NOT NULL,
  revenue_growth_30 int NOT NULL,
  
  rating        decimal(3,2) NOT NULL,
  reviews_total int NOT NULL,
  reviews_30    int NOT NULL,
  reviews_7     int NOT NULL,

  likes_total   int NOT NULL,
  likes_30      int NOT NULL,
  likes_7       int NOT NULL,

  selling_start timestamptz NOT NULL,
  create_time   timestamptz NOT NULL,
  update_time   timestamptz NOT NULL
);

COMMENT ON TABLE product IS '商品信息';
COMMENT ON COLUMN product.product_id IS '产品ID，如：1711117483';
COMMENT ON COLUMN product.uri IS '产品URL地址，可链接到网页';

COMMENT ON COLUMN product.name IS '产品名称，如：現貨 電競霧面滿版 HUAWEI MATE20X 5D熱彎曲面 MATE20 PRO 電競御用';
COMMENT ON COLUMN product.brand IS '产品品牌，如：xiaomi';
COMMENT ON COLUMN product.image_url IS '产品主图URL，如：https://s-cf-tw.shopeesz.com/file/ede41a511f6f79c0faf11551e771b09f';

COMMENT ON COLUMN product.catetory_path_name IS '产品所属类目，如：手機平板與周邊>Android保護貼>華為保護貼';
COMMENT ON COLUMN product.catetory_path_en IS '产品英文类目，如：Mobile & Gadgets>Android Phone Screen Protector>Huawei';
COMMENT ON COLUMN product.catetory_path_id IS '产品三级节点ID，如：1883:9999:10933';

COMMENT ON COLUMN product.is_oversea IS '是否属于海外，Y-海外，N-本地';
COMMENT ON COLUMN product.variations IS '变体数量，如：7';

COMMENT ON COLUMN product.shop_id IS '店铺ID，如：28802775';
COMMENT ON COLUMN product.shop_owner IS '店主ID，如：rock82911';
COMMENT ON COLUMN product.shop_name IS '店铺名称，如：VOUGE 3C - 專營各式高品質手機平板鋼化玻璃保護貼';

COMMENT ON COLUMN product.location IS '产品发货地，如：新北市新莊區';

COMMENT ON COLUMN product.selling_start IS '上架日期，如：2019-08-02';
COMMENT ON COLUMN product.status IS '上架状态，available-已上架，unavailable-已下架，empty-已售罄';
COMMENT ON COLUMN product.preferred IS '是否属于虾皮优选，Y-属于，N-不属于';

COMMENT ON COLUMN product.min_price IS '折后最低售价(该国货币)';
COMMENT ON COLUMN product.max_price IS '折后最高售价(该国货币)';
COMMENT ON COLUMN product.discount IS '折扣(0 ~ 100)，如：7折(70)';

COMMENT ON COLUMN product.sales_total IS '累计总销量';
COMMENT ON COLUMN product.sales_30 IS '最近30天销量';
COMMENT ON COLUMN product.sales_7 IS '最近7天销量';
COMMENT ON COLUMN product.sales_growth_30 IS '近30天销量增长率,如：120%';
COMMENT ON COLUMN product.sales_trend_30 IS '最近30天日销量走势，如：[30,40,...n]';
COMMENT ON COLUMN product.sales_trend_month IS '最近13月的月销量走势';

COMMENT ON COLUMN product.revenue_30 IS '最近30天销售额';
COMMENT ON COLUMN product.revenue_7 IS '最近7天销售额';
COMMENT ON COLUMN product.revenue_growth_30 IS '近30天销售额增长率,如：120%';

COMMENT ON COLUMN product.rating IS '产品评分值，如：4.95';
COMMENT ON COLUMN product.reviews_total IS '累计评论总数，如：301';
COMMENT ON COLUMN product.reviews_30 IS '最近30天新增评论数';
COMMENT ON COLUMN product.reviews_7 IS '最近7天新增评论数';

COMMENT ON COLUMN product.likes_total IS '累计点赞总数';
COMMENT ON COLUMN product.likes_30 IS '最近30天点赞数';
COMMENT ON COLUMN product.likes_7 IS '最近7天点赞数';

COMMENT ON COLUMN product.stock IS '所有变体总库存数量';
COMMENT ON COLUMN product.create_time IS '该条记录创建时间';
COMMENT ON COLUMN product.update_time IS '该条记录更新时间';