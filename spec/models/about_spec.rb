require 'rails_helper'

describe About do

  it 'About正常映射到了数据库' do
    About.create :title => '关于我们', :content => '我们拼团宝是....'

    About.all.size.should == 1
    About.count.should == 1
  end
end
