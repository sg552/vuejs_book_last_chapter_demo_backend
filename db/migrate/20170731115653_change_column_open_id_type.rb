class ChangeColumnOpenIdType < ActiveRecord::Migration
  def change
    change_column :customers, :open_id, :string
  end
end
