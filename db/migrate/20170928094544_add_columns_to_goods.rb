class AddColumnsToGoods < ActiveRecord::Migration
  def change
    add_column :goods, :is_display, :boolean
    add_column :goods, :is_hot, :boolean
  end
end
