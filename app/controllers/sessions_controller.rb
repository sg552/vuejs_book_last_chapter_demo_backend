# -*- encoding : utf-8 -*-
class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, :authenticate_user!

  def create
    @title = '丝路乐购'
    @h5_server = Settings.h5_server

    #request_url
    #auth/wechat

    @openid = auth_hash.fetch('extra').fetch('raw_info').fetch("openid") rescue ''
    logger.info "== openid: #{@openid}"
    logger.info auth_hash.inspect
    wechat_user_info = auth_hash.fetch('extra').fetch('raw_info')
    logger.info "== wechat_user_info: #{wechat_user_info}"

    @customer = Customer.find_by_open_id(@openid)
    if @customer.blank? and @openid.present?
      begin
        @customer = Customer.new(:open_id => @openid,
                                 :avatar=>wechat_user_info.fetch('headimgurl'),
                                 :name=>wechat_user_info.fetch('nickname')
                                )
        @customer.save(:validate=>false)
      rescue Exception => e
        @customer = Customer.new(:open_id => @openid,
                                 :name=> '丝路新人',
                                 :avatar=>wechat_user_info.fetch('headimgurl')
                                )
        @customer.save(:validate=>false)
      end

    end

    Rails.logger.info "跳转到首页 ===== 路径 === #{@h5_server}?open_id=#{@openid}"
    redirect_to "#{@h5_server}?open_id=#{@openid}"
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

  def params_hash
    request.env['omniauth.params']
  end

end
