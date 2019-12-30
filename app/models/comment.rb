class Comment < ActiveRecord::Base
  belongs_to :good
  belongs_to :member_user
end
