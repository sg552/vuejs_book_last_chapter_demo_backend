class ChangeColumnInCategories < ActiveRecord::Migration
  def change
    change_column :categories, :category_img, :text
  end
end
