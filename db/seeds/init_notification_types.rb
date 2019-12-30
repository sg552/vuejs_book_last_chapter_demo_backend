# -*- encoding : utf-8 -*-
ActiveRecord::Base.transaction do
  NotificationType.destroy_all
  ActiveRecord::Base.connection.execute "ALTER TABLE notification_types AUTO_INCREMENT = 1"

  # 我的消息
  #NotificationType.create name: '1、活动广告通知(管理员)',
  #NotificationType.create name: '2、账户变动通知',
  #NotificationType.create name: '3、红包变动通知',
  #NotificationType.create name: '4、理赔通知',
  #NotificationType.create name: '5、周报月报通知', (暂时未加)

  ## 获客动态
  #NotificationType.create name: '6、查看我的分享链接通知',
  #NotificationType.create name: '7、参与我的团，获取佣金数量通知',
  #NotificationType.create name: '8、邀请新用户成功通知',

  ## 我的下家动态
  #NotificationType.create name: '9、下家获得新客户通知',
  #NotificationType.create name: '10、下家的客户升级成领队通知',
  #NotificationType.create name: '11、下家成功卖出产品通知',
  #NotificationType.create name: '12、下家发展新领队通知',
  #NotificationType.create name: '13、下家的下家人数突破某数量通知',
  #NotificationType.create name: '14、下家的客户突破某数量通知',
  #NotificationType.create name: '15、下家的销售额超过某数量通知',

  ## 达人动态
  #NotificationType.create name: '16、某人下家突破某人数通知',
  #NotificationType.create name: '17、某人的产品购买客户超过某人数通知',
  #NotificationType.create name: '18、某人当日客户超过某人数通知',
  #NotificationType.create name: '19、某人发展领队总人数超过某人数通知',
  #NotificationType.create name: '20、某人当日销售额超过某数量通知',
  #NotificationType.create name: '21、周排行通知',
  #NotificationType.create name: '22、月排行通知',
  #NotificationType.create name: '23、团人数突破指定人数通知',


  NotificationType.create name: '活动广告通知(管理员)'
  NotificationType.create name: '领队我的消息'
  NotificationType.create name: '获客动态'
  NotificationType.create name: '下家动态'
  NotificationType.create name: '达人动态'


  puts 'init notification_types end'


end
