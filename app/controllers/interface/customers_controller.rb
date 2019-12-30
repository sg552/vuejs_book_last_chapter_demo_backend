# -*- encoding : utf-8 -*-
class Interface::CustomersController < Interface::ApplicationController
  def user_info
    customer = Customer.find_by_open_id(params[:open_id])

    render :json => {
      customer:
      {
        id: customer.id,
        name: customer.name,
        avatar: customer.avatar,
      }
    }
  end
end
