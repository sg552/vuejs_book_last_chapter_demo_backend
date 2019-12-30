# -*- encoding : utf-8 -*-
class Interface::OrdersController < Interface::ApplicationController
  def get_all_orders
    customer = Customer.find_by_open_id(params[:open_id])
    if params[:order_status].present?
      if params[:order_status] == "true"
        orders = Order.where("order_status = ? and customer_id = ?", true, customer.id).order("created_at desc")
      elsif params[:order_status] == "false"
        orders = Order.where("order_status = ? and customer_id = ?", false, customer.id).order("created_at desc")
      end
    elsif params[:is_dispatch].present?
      orders = Order.where("is_dispatch= ? and customer_id = ?", params[:is_dispatch], customer.id).order("created_at desc")
    else
      orders = Order.where("customer_id = ?", customer.id).order("created_at desc")
    end

    render :json => {
      orders: orders.map { |order|
        {
          id: order.id,
          order_id: order.order_id,
          total_cost: order.total_cost,
          order_status: order.order_status,
          is_dispatch: order.is_dispatch,
          goods: order.buy_goods.map { |buy_good|
            {
            good_name: buy_good.good.try(:name),
            price: buy_good.good.try(:price),
            quantity: buy_good.try(:quantity),
            good_image: buy_good.good.try(:show_goods_first_image),
            }
          }
        }
      }
    }
  end
end
