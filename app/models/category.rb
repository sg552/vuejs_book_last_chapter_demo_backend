class Category < ActiveRecord::Base
  has_many :goods
  belongs_to :first_category
end
