class AddColumnToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :customer_id, :integer
  end
end
