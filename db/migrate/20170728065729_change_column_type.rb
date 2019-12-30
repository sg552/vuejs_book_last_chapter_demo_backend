class ChangeColumnType < ActiveRecord::Migration
  def change
    change_column :orders, :order_id, :string
  end
end
