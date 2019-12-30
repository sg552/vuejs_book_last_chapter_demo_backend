class MemberUsersController < ApplicationController
  before_action :set_member_user, only: [:show, :edit, :update, :destroy]

  def index
    @member_users = MemberUser.all.page(params[:page]).order("created_at desc")
  end

  #def show
  #end

  #def new
  #  @member_user = MemberUser.new
  #end

  #def edit
  #end

  #def create
  #  @member_user = MemberUser.new(member_user_params)
  #  @member_user.save

  #  redirect_to member_users_path
  #end

  #def update
  #  @member_user.update(member_user_params)

  #  redirect_to member_users_path
  #end

  def destroy
    @member_user.destroy

    redirect_to member_users_path
  end

  private
    def set_member_user
      @member_user = MemberUser.find(params[:id])
    end

    def member_user_params
      params.require(:member_user).permit(:email)
    end
end
