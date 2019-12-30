require 'rails_helper'
describe AboutsController do #, :type => :controller do
  render_views

  before do
    admin_login
    request.env["HTTP_REFERER"] = root_path
    @about = About.create :title => '关于我们'
  end

  it 'should get index' do
    get :index
    response.should be_success
    response.code.should == '200'

  end

  it 'should get show' do
    get :show, :id => @about.id
    response.should be_success
    assigns(:about).title.should == '关于我们'
  end

  it 'should get new' do
    get :new
    response.should be_success
  end

  it 'should post create' do
    title = '关于我们的最新消息。。。。'
    post :create, :about => {
      :title => title,
      :content => '我们公司是国内一流的。。。'
    }
    About.last.title.should ==  title
  end


  it 'should get edit' do
    new_title = 'alaksdjflkasjdf'
    get :edit, :id => @about.id
    response.should be_success
  end

  it 'should put update' do
    new_title = 'alaksdjflkasjdf'
    put :update, :id => @about.id , :about => {
      :title => new_title
    }
    About.find(@about.id).title.should == new_title
  end

  it 'should delete destroy' do
    size_before_delete = About.all.size
    delete :destroy, :id => @about.id
    About.count.should == size_before_delete - 1
  end
end
