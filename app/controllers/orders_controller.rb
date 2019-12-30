class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :dispatch_goods]

  def index
    @orders = Order.all.page(params[:page]).order("created_at desc")
  end

  def show
  end

  def dispatch_goods
    @order.is_dispatch = true
    @order.save

    redirect_to orders_path, notice: "发货成功"
  end

  #def new
  #  @order = Order.new
  #  respond_with(@order)
  #end

  #def edit
  #end

  #def create
  #  @order = Order.new(order_params)
  #  @order.save
  #  respond_with(@order)
  #end

  #def update
  #  @order.update(order_params)
  #  respond_with(@order)
  #end

  #def destroy
  #  @order.destroy
  #  respond_with(@order)
  #end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:order_id, :receiver_name, :receiver_address, :receiver_phone, :total_cost, :order_status, :guest_remarks)
    end
end
