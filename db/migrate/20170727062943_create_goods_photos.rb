class CreateGoodsPhotos < ActiveRecord::Migration
  def change
    create_table :goods_photos do |t|
      t.integer :good_id
      t.string :image_url

      t.timestamps
    end
  end
end
