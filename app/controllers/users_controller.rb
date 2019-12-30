class UsersController <  ApplicationController
  def index
    @users = User.all.page(params[:page]).order("created_at desc")
  end
end

