class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
    @customers = Customer.all.page(params[:page]).order("created_at desc")
  end

  def show
  end

  def new
    @customer = Customer.new
  end

  def edit
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.save

    redirect_to customers_path
  end

  def update
    @customer.update(customer_params)

    redirect_to customers_path
  end

  def destroy
    @customer.destroy

    redirect_to customers_path
  end

  private
    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(:name, :avatar, :open_id)
    end
end
