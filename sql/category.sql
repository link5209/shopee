CREATE TABLE category (
    category_id int         NOT NULL,
    name        text        NOT NULL,
    country    country_type NOT NULL,
    parent_id   int         NOT NULL,
    level       int         NOT NULL,
    create_time timestamptz NOT NULL,
    update_time timestamptz NOT NULL
);

COMMENT ON TABLE category IS '类目信息';
COMMENT ON COLUMN category.category_id IS '类目ID，如：1711';
COMMENT ON COLUMN category.name IS '类目名称';
COMMENT ON COLUMN category.country IS '国家，如 ：ID TW VN TH PH MY SG';
COMMENT ON COLUMN category.parent_id IS '类目父ID，如：1711，一级类目父ID默认-1';
COMMENT ON COLUMN category.level IS '类目层级';
COMMENT ON COLUMN category.create_time IS '记录创建时间';
COMMENT ON COLUMN category.update_time IS '记录更新时间';