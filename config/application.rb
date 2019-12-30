# -*- encoding : utf-8 -*-
require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'log4r'
require 'log4r/yamlconfigurator'
require 'log4r/outputter/datefileoutputter'
include Log4r

Bundler.require(*Rails.groups)

module PinTuanBaoWeb
  class Application < Rails::Application

    config.autoload_paths += %W(#{config.root}/lib)
    log4r_config= YAML.load_file(File.join(File.dirname(__FILE__),"log4r.yml"))
    YamlConfigurator.decode_yaml( log4r_config['log4r_config'] )
    config.logger = Log4r::Logger[Rails.env]

    config.time_zone = "Asia/Shanghai"
    config.active_record.default_timezone = :local
    config.action_controller.permit_all_parameters = true

  end
end
