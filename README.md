# 思路乐购-新疆商城

## 提纲/目录

1. [源代码位置](源代码位置)
2. [下载办法](下载办法)
3. [服务器要求](服务器要求)
4. [环境的配置](环境的配置)
5. [安装](安装)
6. [用到的主要技术](用到的主要技术)
7. [性能指标](性能指标)


## 服务器要求

* Linux: ubuntu 14.04 LTS

## 环境的配置

* Ruby: 2.2.4p230
* Mysql: 5.5+

## 数据库的结构

可以查看  database_structure.sql

## 安装

1. 下载并配置项目文件

	```
	$ git clone https://git.coding.net/sweetysoft/si_lu_le_gou_web.git
	$ cd pin_tuan_bao_web
  $ 修改config/database.yml文件，调整好其中数据库的配置
  $ 修改config/log4r.yml文件，调整好其中的日志配置
	$ bundle install
	$ bundle exec rake db:create
	$ bundle exec rake db:migrate
	```

2. 运行 God

	```
	$ bundle exec god -c calculate.god
	```
3. 运行 Rails 服务器

	```
	$ bundle exec thin -C start config/thin.conf
	```

4. 启动 Delayed job
  $ bundle exec RAILS_ENV=production bin/delayed_job -n 3 start

## 用到的主要技术

1. God 用于保证自动抓取脚本的稳定运行
2. rufu-scheduler 保证抓取脚本定时执行

## 性能指标

1. 首页监控记录以及各个统计页面数据加载时间；

## 目前部署

1. bundle exec cap deploy
