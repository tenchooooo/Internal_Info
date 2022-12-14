class Tag < ApplicationRecord
  has_many :post_tags, dependent: :destroy, foreign_key: 'tag_id'
  has_many :posts,through: :post_tags
  has_many :members,through: :post_tags
  enum tag_status: { open: 0, closed: 1 }

  validates :tag_name, uniqueness: true, presence: true
end
