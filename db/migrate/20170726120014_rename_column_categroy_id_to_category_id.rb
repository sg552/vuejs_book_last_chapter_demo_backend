class RenameColumnCategroyIdToCategoryId < ActiveRecord::Migration
  def change
    rename_column :goods, :categroy_id, :category_id
  end
end
