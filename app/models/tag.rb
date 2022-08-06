class Tag < ApplicationRecord
  has_many :post_tags,dependent: :destroy, forgen_key: 'tag_id'
  has_many :posts,though: :post_tags

  validates :name, uniqueness: true, presence: true
end
