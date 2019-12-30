class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :order_id
      t.string :receiver_name
      t.string :receiver_address
      t.string :receiver_phone
      t.float :total_cost
      t.boolean :order_status
      t.string :guest_remarks

      t.timestamps
    end
  end
end
