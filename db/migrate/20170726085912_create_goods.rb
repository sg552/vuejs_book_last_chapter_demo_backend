class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.string :name
      t.string :description
      t.string :image_url
      t.integer :categroy_id
      t.integer :order_id

      t.timestamps
    end
  end
end
