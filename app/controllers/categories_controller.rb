class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all.page(params[:page]).order("created_at desc")
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    Tool.upload_image(params[:category], :category_img)

    @category = Category.new(category_params)
    @category.save

    redirect_to categories_path, notice: '新建成功'
  end

  def update
    Tool.upload_image(params[:category], :category_img)
    @category.update(category_params)

    redirect_to categories_path, notice: '编辑成功'
  end

  def destroy
    @category.destroy

    redirect_to categories_path, notice: '删除成功'
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :category_img, :first_category_id)
    end
end
