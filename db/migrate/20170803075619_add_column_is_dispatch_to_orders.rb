class AddColumnIsDispatchToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :is_dispatch, :boolean, default: false
  end
end
