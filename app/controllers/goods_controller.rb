class GoodsController < ApplicationController
  before_action :set_good, only: [:show, :edit, :update, :destroy, :set_display, :set_hot]

  def index
    @goods = Good.all.page(params[:page]).order("created_at desc")
    @goods = @goods.where("name like ?", "%#{params[:name]}%") if params[:name].present?
  end

  def show
  end

  def new
    @good = Good.new
  end

  def edit
  end

  def create
    @good = Good.new(good_params)
    @good.save

    if params[:photos].present?
      Tool.upload_images(params[:photos][:image_url], @good.id, "good_id", GoodsPhoto)
    end
    flash[:success] = "新建成功"

    redirect_to goods_path
  end

  def update
    @good.update(good_params)

    if params[:photos].present?
      @good.goods_photos.destroy_all   #将原来的图片删掉
      Tool.upload_images(params[:photos][:image_url], @good.id, "good_id", GoodsPhoto)
    end
    flash[:success] = "编辑成功"

    redirect_to goods_path
  end

  def destroy
    @good.destroy
    flash[:success] = "删除成功"

    redirect_to goods_path
  end

  def set_display
    if @good.is_display
      @good.is_display = false
      @good.save
      redirect_to goods_path, notice: '下架成功'
    else
      @good.is_display = true
      @good.save
      redirect_to goods_path, notice: '上架成功'
    end
  end

  def set_hot
    if @good.is_hot
      @good.is_hot = false
      @good.save
      redirect_to goods_path, notice: '取消推荐成功'
    else
      @good.is_hot = true
      @good.save
      redirect_to goods_path, notice: '商品推荐成功'
    end
  end

  private
    def set_good
      @good = Good.find(params[:id])
    end

    def good_params
      params.require(:good).permit(:name, :advertisement, :inventory, :good_attribute, :description, :price, :original_price, :category_id)
    end
end
