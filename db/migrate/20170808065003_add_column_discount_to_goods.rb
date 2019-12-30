class AddColumnDiscountToGoods < ActiveRecord::Migration
  def change
    add_column :goods, :discount, :float
  end
end
