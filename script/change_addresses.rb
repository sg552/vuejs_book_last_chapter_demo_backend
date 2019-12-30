# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'rails'

Rails.logger.info "=== before "

zhi_xia_shi_ids = [1, 2, 9, 22]

max_city_id = 488

zhi_xia_shi_ids.each do |province_id|
  zhi_xia_shi_province = Province.find province_id
  # 1. 把直辖市的名字，写入到 cities
  city = City.create :name => zhi_xia_shi_province.name,
    :province_id => province_id

  # 2. 在cities中的直辖市的各个区，写入到 town 中。
  towns = City.where('province_id = ? and id < ?', province_id, max_city_id)
  towns.each do |town|
    Town.create :name => town.name,
      :city_id => city.id
    # 3. 把 cities 中的直辖市的各个区，都删掉。
    town.delete
  end
end

Rails.logger.info "=== done"
puts "done"
