# -*- encoding : utf-8 -*-
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :wechat, Settings.wechat.app_id, Settings.wechat.app_secret
end
