class AddColumnFirstCategoryIdToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :first_category_id, :integer
  end
end
