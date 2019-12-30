class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save

    redirect_to comments_path, notice: "新建成功"
  end

  def update
    @comment.update(comment_params)

    redirect_to comments_path, notice: "编辑成功"
  end

  def destroy
    @comment.destroy

    redirect_to comments_path, notice: "删除成功"
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:member_user_id, :good_id, :nickname, :content, :is_display)
    end
end
