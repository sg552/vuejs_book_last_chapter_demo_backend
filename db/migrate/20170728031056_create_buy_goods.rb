class CreateBuyGoods < ActiveRecord::Migration
  def change
    create_table :buy_goods do |t|
      t.integer :good_id
      t.integer :quantity

      t.timestamps
    end
  end
end
