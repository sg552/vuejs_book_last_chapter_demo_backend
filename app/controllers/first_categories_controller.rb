class FirstCategoriesController < ApplicationController
  before_action :set_first_category, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @first_categories = FirstCategory.all.page(params[:page])
  end

  def show
  end

  def new
    @first_category = FirstCategory.new
  end

  def edit
  end

  def create
    Tool.upload_image(params[:first_category], :logo)
    @first_category = FirstCategory.new(first_category_params)
    @first_category.save
    flash[:success] = "新建成功"

    redirect_to first_categories_path
  end

  def update
    Tool.upload_image(params[:first_category], :logo)
    @first_category.update(first_category_params)
    flash[:success] = "编辑成功"

    redirect_to first_categories_path
  end

  def destroy
    @first_category.destroy
    flash[:success] = "删除成功"

    redirect_to first_categories_path
  end

  private
    def set_first_category
      @first_category = FirstCategory.find(params[:id])
    end

    def first_category_params
      params.require(:first_category).permit(:name, :logo)
    end
end
