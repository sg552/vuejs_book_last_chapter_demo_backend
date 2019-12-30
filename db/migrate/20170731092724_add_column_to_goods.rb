class AddColumnToGoods < ActiveRecord::Migration
  def change
    add_column :goods, :original_price, :float
  end
end
