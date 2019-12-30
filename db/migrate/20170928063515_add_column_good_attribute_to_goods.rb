class AddColumnGoodAttributeToGoods < ActiveRecord::Migration
  def change
    add_column :goods, :good_attribute, :text
  end
end
