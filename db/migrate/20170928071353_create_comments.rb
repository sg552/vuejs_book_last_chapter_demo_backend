class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :member_user_id
      t.integer :good_id
      t.string :nickname
      t.text :content
      t.boolean :is_display

      t.timestamps
    end
  end
end
