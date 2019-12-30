class AddColumnsToUserAddresses < ActiveRecord::Migration
  def change
    add_column :user_addresses, :belongs_to_street, :string
    add_column :user_addresses, :address_sign, :string
    add_column :user_addresses, :is_default, :boolean, default: false
    add_column :user_addresses, :province_id, :integer
    add_column :user_addresses, :city_id, :integer
    add_column :user_addresses, :town_id, :integer
  end
end
