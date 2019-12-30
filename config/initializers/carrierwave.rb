# -*- encoding : utf-8 -*-
CarrierWave.configure do |config|
  config.storage = :upyun
  config.upyun_username = Settings.carrierwave.operator
  config.upyun_password = Settings.carrierwave.password
  config.upyun_bucket = Settings.carrierwave.bucket
  config.upyun_bucket_host = Settings.carrierwave.bucket_host
end
