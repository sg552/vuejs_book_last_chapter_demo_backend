class AddColumnsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :payed_price, :float
    add_column :orders, :payed_at, :string
    add_column :orders, :payed_response, :string
  end
end
