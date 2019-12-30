class ChangeColumnPayedResponseType < ActiveRecord::Migration
  def change
    change_column :orders, :payed_response, :text
  end
end
