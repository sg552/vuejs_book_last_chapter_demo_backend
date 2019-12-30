class ShopCartGood < ActiveRecord::Base
  belongs_to :shop_cart
  belongs_to :good
end
