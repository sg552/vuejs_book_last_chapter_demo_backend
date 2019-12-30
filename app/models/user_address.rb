class UserAddress < ActiveRecord::Base
  belongs_to :member_user
  belongs_to :province
  belongs_to :city
  belongs_to :town
  has_many :orders
end
