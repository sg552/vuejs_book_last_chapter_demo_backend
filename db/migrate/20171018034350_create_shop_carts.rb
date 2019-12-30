class CreateShopCarts < ActiveRecord::Migration
  def change
    create_table :shop_carts do |t|
      t.integer :member_user_id
      t.integer :buy_quantity
      t.boolean :is_create_order

      t.timestamps
    end
  end
end
