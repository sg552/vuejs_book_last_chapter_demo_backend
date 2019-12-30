class ShopCart < ActiveRecord::Base
  belongs_to :member_user
  has_many :shop_cart_goods
end
