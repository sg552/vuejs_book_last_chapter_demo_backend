# -*- encoding : utf-8 -*-
ActiveRecord::Base.transaction do
  ProductCategory.destroy_all
  ActiveRecord::Base.connection.execute "ALTER TABLE product_categories AUTO_INCREMENT = 1"

  ProductCategory.create name: '意外险'
  ProductCategory.create name: '健康险'
  ProductCategory.create name: '汽车险'

  puts 'init product category end'


end
