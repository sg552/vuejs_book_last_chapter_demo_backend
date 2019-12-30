class AddColumnsIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :user_address_id, :integer
    add_column :orders, :member_user_id, :integer
    add_column :orders, :mode_of_payment, :string
  end
end
