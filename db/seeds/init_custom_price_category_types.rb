# -*- encoding : utf-8 -*-
ActiveRecord::Base.transaction do
  CustomPriceCategoryType.destroy_all
  ActiveRecord::Base.connection.execute "ALTER TABLE custom_price_category_types AUTO_INCREMENT = 1"

  CustomPriceCategoryType.create name: '保障年龄'
  CustomPriceCategoryType.create name: '保障期限'
  CustomPriceCategoryType.create name: '保障计划'
  CustomPriceCategoryType.create name: '其他'
  CustomPriceCategoryType.create name: '性别'
  CustomPriceCategoryType.create name: '职业'

  puts 'init custom_price_category_types end'


end
