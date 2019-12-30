class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :avatar
      t.integer :open_id

      t.timestamps
    end
  end
end
