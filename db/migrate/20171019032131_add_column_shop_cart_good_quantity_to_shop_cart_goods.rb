class AddColumnShopCartGoodQuantityToShopCartGoods < ActiveRecord::Migration
  def change
    add_column :shop_cart_goods, :shop_cart_good_quantity, :integer
  end
end
