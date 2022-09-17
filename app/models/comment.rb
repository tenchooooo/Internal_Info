class Comment < ApplicationRecord
  belongs_to :member #Comment.memberでコメントの所有者を取得
  belongs_to :post #Comment.postでそのコメントがされた投稿を取得

  validates :comment_content, presence: true
end
