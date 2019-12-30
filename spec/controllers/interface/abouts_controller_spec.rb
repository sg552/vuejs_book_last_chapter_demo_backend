require 'rails_helper'
describe Interface::AboutsController do

  it 'should get index' do

    About.create :title => '关于我们', :content => '我们拼团宝是国内一流的。。。'
    get :index

    json = JSON.parse(response.body)
    puts "== json.inspect: #{json.inspect}"
    json['about_us']['title'].should == '关于我们'
  end

end
