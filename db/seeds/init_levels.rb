# -*- encoding : utf-8 -*-
ActiveRecord::Base.transaction do
  Level.destroy_all
  ActiveRecord::Base.connection.execute "ALTER TABLE levels AUTO_INCREMENT = 1"

  Level.create name: '铜牌领队', level_up_condition: 5, weight: 0
  Level.create name: '银牌领队', level_up_condition: 10, weight: 1
  Level.create name: '黄金领队', level_up_condition: 50, weight: 2
  Level.create name: '钻石领队', level_up_condition: 150, weight: 3
  Level.create name: '皇冠领队', level_up_condition: 350, weight: 4
  Level.create name: '金皇冠领队', level_up_condition: 700, weight: 5

  puts 'init levels end'


end
