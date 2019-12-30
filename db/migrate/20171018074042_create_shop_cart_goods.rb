class CreateShopCartGoods < ActiveRecord::Migration
  def change
    create_table :shop_cart_goods do |t|
      t.integer :good_id
      t.integer :shop_cart_id

      t.timestamps
    end
  end
end
