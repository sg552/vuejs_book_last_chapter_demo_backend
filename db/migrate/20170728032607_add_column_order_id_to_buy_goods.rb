class AddColumnOrderIdToBuyGoods < ActiveRecord::Migration
  def change
    add_column :buy_goods, :order_id, :integer
  end
end
