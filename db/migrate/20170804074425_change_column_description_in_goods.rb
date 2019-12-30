class ChangeColumnDescriptionInGoods < ActiveRecord::Migration
  def change
    change_column :goods, :description, :text
  end
end
