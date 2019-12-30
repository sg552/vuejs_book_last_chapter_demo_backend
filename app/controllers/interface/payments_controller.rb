# -*- encoding : utf-8 -*-
class Interface::PaymentsController < Interface::ApplicationController
  # 企业支付
  # /interface/payments/pay?
  def pay
    #request_id = rand(1000).to_s
    #begin_time = Time.now.to_f
    #Rails.logger.info "==== 企业支付了一笔钱 ===="
    #Rails.logger.info "== request_id: #{request_id}, request begin at: #{begin_time}"

    #response = Tool.pay({
    #      # 这里是以分作为单位。 微信企业支付接口是这么要求的。
    #      :amount => '101', # 企业支付每次必须大于1元 钱数
    #      :openid => 'o1GmjwVarmzOwWmn5J2KvCW9juMs', # 用户open_id
    #      :partner_trade_no => "CompanyPay#{Time.now.to_i}" # 订单号，保证唯一 必须是33位以下的数字和字母组合
    #    })

    #render :text => response.body

    #Rails.logger.info "== request_id: #{request_id}, request after at: #{Time.now.to_f - begin_time}"
  end

  # 用户支付
  # /interface/payments/user_pay?
  def user_pay
    request_id = rand(1000).to_s
    begin_time = Time.now.to_f
    Rails.logger.info "==== 用户支付了一笔钱 ===="
    Rails.logger.info "== request_id: #{request_id}, request begin at: #{begin_time}"
    Rails.logger.info "== 预支付金额 price == #{params[:total_cost]}"

    result = Tool.user_pay({
          # 这里是以分作为单位。 微信企业支付接口是这么要求的。
          :total_fee => (params[:total_cost].to_f * 100).to_i , # 支付总金额 不能有小数点(文档要求)
          :openid => params[:open_id], # 用户open_id
          :out_trade_no => params[:order_number], # 订单号，保证唯一
          })

    render :json => result

    Rails.logger.info "== result === #{result}"
    Rails.logger.info "== request_id: #{request_id}, request after at: #{Time.now.to_f - begin_time}"
  end

  # 微信支付成功后调用
  def notify
    Rails.logger.info "=============== 微信支付成功回调 =============="
    logger.info "== notify from weixin server: "
    logger.info params.inspect
    logger.info "== notify from weixin server( done ) : "

    # 请求是由 微信服务器 发送过来.
		result = Hash.from_xml(request.body.read)["xml"]

    Rails.logger.info "== notify result: #{result}"

		if WxPay::Sign.verify?(result)
      order_id = result["out_trade_no"].to_s
      logger.info "==  success result == #{result.inspect}"
      logger.info "==  sign verified"
      Rails.logger.info "== order_no: #{result["out_trade_no"]}-------"
			@order = Order.find_by_order_id(order_id)
      logger.info "==  #{@order.inspect} order !!!!!----"

			unless @order.blank?
        logger.info "==  order is not blank !!!!!----"
        time = Time.now.to_datetime
        payed_price = result["total_fee"].to_f / 100.0

        Rails.logger.info "== time : #{time}"
        Rails.logger.info "== payed_price: #{payed_price}"

        Order.transaction do
            @order.update_attributes(
              :order_status => true,
              :payed_price => payed_price,
              :payed_at => time,
              :payed_response => result.to_s
            )
        end
			end

			render :xml => { return_code: "SUCCESS" }.to_xml(root: 'xml', dasherize: false)
		else
      logger.info "==  error result == #{result.inspect}"
      logger.error "==  sign NOT verified"
			render :xml => { return_code: "FAIL", return_msg: "" }.to_xml(root: 'xml', dasherize: false)
		end
  end

end
