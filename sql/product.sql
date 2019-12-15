
CREATE TABLE product_daily
CREATE TABLE product_weekly
  COMMENT ON COLUMN product.sales_growth_week IS '销量增长率-按周';
  COMMENT ON COLUMN product.revenue_1 IS '最近1天销售额';

CREATE TABLE product_monthly




CREATE TABLE product (
  product_id bigint PRIMARY KEY NOT NULL,
  uri text NOT NULL,
  name text NOT NULL,
  image_url text NOT NULL,
  brand text,

  catetory_path_name text NOT NULL,
  catetory_path_en text NOT NULL,
  catetory_path_id text NOT NULL,

  is_oversea bool DEFAULT NULL,
  variations int(3) DEFAULT NULL,

  shop_id int(10) DEFAULT NULL,
  shop_owner text DEFAULT NULL,
  shop_name text DEFAULT NULL,
  location text DEFAULT NULL,
  
  selling_start date DEFAULT NULL,
  status char(1) DEFAULT NULL,
  preferred char(1) DEFAULT NULL,
  min_price float(10,2) DEFAULT NULL,
  max_price float(10,2) DEFAULT NULL,
  discount text DEFAULT NULL,

  sales_total int(8) DEFAULT NULL,
  sales_30 int(8) DEFAULT NULL,
  sales_7 int(8) DEFAULT NULL,
  sales_growth_30 float(8,2) DEFAULT NULL,

  sales_trend_day jsonb NOT NULL,
  sales_trend_month jsonb NOT NULL,

  revenue_30 float(10,2) NOT NULL,
  revenue_7 float(10,2) NOT NULL,
  revenue_growth_30 float(10,2) NOT NULL,
  
  rating float(3,2) DEFAULT NULL,
  reviews_total int(8) DEFAULT NULL,
  reviews_30 int(8) DEFAULT NULL,
  reviews_7 int(8) DEFAULT NULL,
  likes_total int(8) DEFAULT NULL,
  likes_30 int(8) DEFAULT NULL,
  likes_7 int(8) DEFAULT NULL,
  stock int(8) DEFAULT NULL,
  created_time datetime NOT NULL,
  updated_time datetime DEFAULT NULL,
  UNIQUE (country, product_id)
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
COMMENT ON COLUMN product.shop_owner IS '店铺标识，如：rock82911';
COMMENT ON COLUMN product.shop_name IS '店铺名称，如：VOUGE 3C - 專營各式高品質手機平板鋼化玻璃保護貼';

COMMENT ON COLUMN product.location IS '产品发货地，如：新北市新莊區';

COMMENT ON COLUMN product.selling_start IS '上架日期，如：2019-08-02';
COMMENT ON COLUMN product.status IS '上架状态，A-已上架Available，U-已下架Unavailable，E-已售罄Empty';
COMMENT ON COLUMN product.preferred IS '是否属于虾皮优选，Y-属于，N-不属于';

COMMENT ON COLUMN product.min_price IS '折后最低售价(该国货币)';
COMMENT ON COLUMN product.max_price IS '折后最高售价(该国货币)';
COMMENT ON COLUMN product.discount IS '折扣，如：7折';

COMMENT ON COLUMN product.sales_total IS '累计总销量';
COMMENT ON COLUMN product.sales_30 IS '最近30天销量';
COMMENT ON COLUMN product.sales_7 IS '最近7天销量';
COMMENT ON COLUMN product.sales_growth_30 IS '近30天销量增长率';
COMMENT ON COLUMN product.sales_trend_day IS '最近30天日销量走势，json格式';
COMMENT ON COLUMN product.sales_trend_month IS '最近13月的月销量走势，json格式';

COMMENT ON COLUMN product.revenue_30 IS '最近30天销售额';
COMMENT ON COLUMN product.revenue_7 IS '最近7天销售额';
COMMENT ON COLUMN product.revenue_growth_30 IS '近30天销售额增长率';

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