class Town < ActiveRecord::Base
  belongs_to :city
  has_many :user_addresses
end
