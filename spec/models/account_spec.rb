require 'rails_helper'

describe Account do
  it 'should belongs_to customer' do
    customer = Customer.create :name => '张三'
    customer.account.id.should > 0
    Account.first.customer.id.should > 0

  end
end
