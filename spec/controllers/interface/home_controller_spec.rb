require 'rails_helper'
describe Interface::HomeController do

  before do
    @customer = build(:customer)
    @customer.save

    (0..2).each do
      create(:gallery)
    end

    category = create(:product_category)
    create(:product_category, name: '健康险')
    create(:product_category, name: '旅游险')

    home_category = create(:home_special_category)

    @product = create(:product,
      home_special_category_id: home_category.id,
      product_category_id: category.id)
  end

  it 'home index' do
    get :index, :customer_id => @customer.id
    json = JSON.parse(response.body)
    puts "json.inspect #{json.inspect}"
    json['ad_images'].length.should == 3
    json['categories'].length.should == 3
    json['home_categories'][0]['products'][0]['name'].should == '君龙驾乘意外险'
    json['total_income'].should == nil
    json['today_income'].should == 0.0
    @product.home_special_category.name.should == '拼免费'
  end

end
