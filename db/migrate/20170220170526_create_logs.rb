class CreateLogs < ActiveRecord::Migration

  def change
    create_table :logs, :comment => '记录日志的表' do |t|
      t.string :controller, :comment => 'rails 控制器'
      t.string :action, :comment => 'rails action'
      t.string :user_name, :comment => '当前登录用户名'
      t.text :parameters, :comment => 'rails的 params'
      t.datetime :created_at, :comment => '创建时间'
      t.string :remote_ip, :comment => '远程IP'
      t.string :restful_method, :comment => 'get/post/put/delete'
    end
  end

end
