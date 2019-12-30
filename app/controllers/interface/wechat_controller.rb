class Interface::WechatController < Interface::ApplicationController
  def index
    $wechat_client ||= WeixinAuthorize::Client.new(Settings.wechat.app_id, Settings.wechat.app_secret)
    if $wechat_client.is_valid? # 判断是否配置正确
      Rails.logger.info "== request #{} =="
      Rails.logger.info "== wechat_client =#{$wechat_client.inspect}"
      Rails.logger.info "== access_token = #{$wechat_client.access_token}"
      sign_package = $wechat_client.get_jssign_package(params[:url])
      sign_package["access_token"] = $wechat_client.access_token
      return render json: sign_package
    end
    render json: { message: '失败' }
  end
end
