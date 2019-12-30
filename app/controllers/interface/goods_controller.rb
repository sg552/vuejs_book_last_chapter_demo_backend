# -*- encoding : utf-8 -*-
class Interface::GoodsController < Interface::ApplicationController
  def get_goods
    goods = Good.all.order("created_at desc")

    render :json => {
      goods: goods.map { |good|
        {
          id: good.id,
          name: good.name,
          description: good.description,
          image_url: good.goods_photos.first.image_url,
          category_id: good.category_id
        }
      }
    }
  end

  def goods_details
    good = Good.find(params[:good_id])

    render :json => {
      good: {
        id: good.id,
        name: good.name,
        description: good.description,
        price: good.price.to_f,
        original_price: good.original_price.to_f,
        category_id: good.category_id
      },
      good_images: good.goods_photos.map { |photo|
         photo.image_url
      }
    }
  end

  def buy
    customer = Customer.find_by_open_id(params[:open_id])

    order = Order.new(
      :receiver_address => params[:mobile_user_address],
      :receiver_name => params[:mobile_user_name],
      :receiver_phone => params[:mobile_user_phone],
      :total_cost => params[:total_cost],
      :order_status => false,
      :guest_remarks => params[:guest_remarks],
      :customer_id => customer.id
    )
    if params[:good_id].present?
      Order.transaction do
        good = Good.find(params[:good_id])
        order.generate_order_id
        order.save
        Rails.logger.info("订单号======== #{order.order_id}")

        buy_good = BuyGood.new(
          :order_id => order.id,
          :good_id => params[:good_id],
          :quantity => params[:buy_count]
        )
        buy_good.save

        render json: {
          amount: order.total_cost,
          order_number: order.order_id,
          order_id: order.id
        }
      end
    elsif params[:goods].present?
      Rails.logger.info " goods ===== #{params[:goods].values} "
      #render json: {
      #   message: 'error'
      #} and return

      Order.transaction do
        order.generate_order_id
        order.save
        Rails.logger.info("订单号======== #{order.order_id}")

        params[:goods].values.each do |good|
          buy_good = BuyGood.new(
            :order_id => order.id,
            :good_id => good[:id],
            :quantity => good[:quantity]
          )
          buy_good.save
        end

        render json: {
          amount: order.total_cost,
          order_number: order.order_id,
          order_id: order.id
        }
      end
    end
  end

  def buy_success
    #order = Order.find_by_order_id(params[:order_id])
    order = Order.last

    render :json => {
      order:
        {
          id: order.id,
          receiver_name: order.receiver_name,
          receiver_address: order.receiver_address,
          receiver_phone: order.receiver_phone,
          total_cost: order.total_cost,
        }
    }
  end

end
