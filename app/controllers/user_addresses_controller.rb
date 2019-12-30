class UserAddressesController < ApplicationController
  before_action :set_user_address, only: [:show, :edit, :update, :destroy]

  def index
    @user_addresses = UserAddress.all
  end

  def show
  end

  def new
    @user_address = UserAddress.new
  end

  def edit
  end

  def create
    @user_address = UserAddress.new(user_address_params)
    @user_address.save

    redirect_to user_addresses_path
  end

  def update
    @user_address.update(user_address_params)

    redirect_to user_addresses_path
  end

  def destroy
    @user_address.destroy

    redirect_to user_addresses_path
  end

  private
    def set_user_address
      @user_address = UserAddress.find(params[:id])
    end

    def user_address_params
      params.require(:user_address).permit(:name, :post_code, :region, :detail_address, :phone_number, :fixed_telephone, :email, :delivery_time)
    end
end
