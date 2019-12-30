class Interface::ApplicationController < ActionController::Base

  after_filter :set_access_control_headers

  def set_access_control_headers
    headers['Access-Control-Allow-Origin']='*'
    headers['Access-Control-Allow-Methods']='POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method']='*'
    headers['Access-Control-Allow-Headers']='Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end

  def auth_customer
    error_msg={}
    #获取uuid参数
    if params[:open_id].blank?
      error_msg[:msg]="未提供参数OPENID"
      error_msg[:status]=400
      render :json=>error_msg.to_json()
      return
    end

    @customer = Customer.find_by_open_id(params[:open_id])
    if @customer.blank?
      error_msg[:msg]="无效UUID,请重新登录"
      error_msg[:status]=400
      render :json=>error_msg.to_json()
      return
    end
  end
end
