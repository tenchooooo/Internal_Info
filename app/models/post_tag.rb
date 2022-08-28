class PostTag < ApplicationRecord
  belongs_to :post
  belongs_to :tag
  belongs_to :member
  validates :post_id, presence: true
  validates :tag_id, presence: true
  validates :member_id, presence: true
  
end
