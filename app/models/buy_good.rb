class BuyGood < ActiveRecord::Base
  belongs_to :order
  belongs_to :good

  def show_goods_first_image
    self.good.goods_photos.first.image_url
  end
end
