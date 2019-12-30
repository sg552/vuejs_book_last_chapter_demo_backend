class CreateTowns < ActiveRecord::Migration
  def change
    create_table :towns do |t|
      t.string :name
      t.integer :city_id

      t.timestamps
    end
  end
end
