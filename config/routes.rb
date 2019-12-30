Rails.application.routes.draw do

  resources :first_categories

  resources :user_addresses

  resources :comments

  resources :customers

  resources :member_users

  resources :orders do
    collection do
      post :dispatch_goods
    end
  end

  resources :categories

  resources :goods do
    collection do
      post :set_display
      post :set_hot
    end
  end

  devise_for :users

  resources :users

  root 'users#index'

  namespace "monitor" do
    resources "logs"
  end

  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]

  mount Ckeditor::Engine => '/ckeditor'

  namespace :interface do
    resources :wechat, only: [:index]

    resources :payments do
      collection do
        post :pay
        post :user_pay
        post :notify
      end
    end

    resources :goods do
      collection do
        get :get_goods
        get :goods_details
        post :buy
        get :buy_success
      end
    end

    resources :customers do
      collection do
        get :user_info
      end
    end

    resources :orders do
      collection do
        get :get_all_orders
      end
    end

  end
end
