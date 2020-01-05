# shopee

数据表更新流程：
save: sku_history(before trigger) -> upsert: sku -> save: product_history(before trigger) -> upsert: product
反映了逐层依赖关系
trigger会自动填充日更新缺失的数据，使其标准化数据，让自然周/月统计，最近xx天销量/销售额等聚合数据都可以按照标准化后的数据进行处理
