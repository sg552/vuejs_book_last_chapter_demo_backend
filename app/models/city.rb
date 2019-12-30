class City < ActiveRecord::Base
  has_many :towns
  belongs_to :province
  has_many :user_addresses
end
