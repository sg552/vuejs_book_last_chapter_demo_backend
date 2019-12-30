class CreateUserAddresses < ActiveRecord::Migration
  def change
    create_table :user_addresses do |t|
      t.integer :member_user_id
      t.string :name
      t.string :post_code
      t.string :region
      t.string :detail_address
      t.string :phone_number
      t.string :fixed_telephone
      t.string :email
      t.string :delivery_time

      t.timestamps
    end
  end
end
