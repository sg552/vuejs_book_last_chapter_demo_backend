require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'httparty'
require 'rails'

#初始化三个表的脚本
# 定义URL
url = "http://www.helloweba.com/demo/cityselect/js/city.js"
response = HTTParty.get  url

# 获取 到结果
ActiveRecord::Base.transaction do

  puts "init address start ..."

	items = JSON.parse(response.body) rescue []
	return if items.blank?
	items['citylist'].each do |province|
		province_name = province['p']
		@province = Province.create :name => province_name
		Rails.logger.info "province ==!!!!!==!!!!!== #{province_name}"

		next if province['c'].blank?
		province['c'].each do |city|
			city_name = city['n']
			@city = City.create :name => city_name, :province_id => @province.id
			Rails.logger.info "city ======== #{city_name}"

			next if city['a'].blank?
      city['a'].each do |town|
      town_name = town['s']
			@town = Town.create :name => town_name, :city_id => @city.id
			Rails.logger.info "town ======== #{town_name}"
			end
		end
	end

  puts "init address end ..."
end
