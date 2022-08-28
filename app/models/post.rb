class Post < ApplicationRecord
   has_one_attached :image
   has_many :post_tags, dependent: :destroy
   has_many :tags, through: :post_tags
   belongs_to :member
   has_many :checks, dependent: :destroy
   has_many :comments, dependent: :destroy #Post.commentsで、投稿が所有するコメントを取得できる。
   has_many :checks


   enum browse_status: { open: 0, closed: 1 }

  def save_tag(sent_tags)
    # タグが存在していれば、タグの名前を配列として全て取得
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    # 現在取得したタグから送られてきたタグを除いてoldtagとする
    old_tags = current_tags - sent_tags
    # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
    new_tags = sent_tags - current_tags
    # 古いタグを消す
    old_tags.each do |old|
      self.tags.delete　Tag.find_by(tag_name: old)
    end
    # 新しいタグを保存
    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(tag_name: new)
      post_tags.new(member_id: member_id,tag_id: new_post_tag.id).save
    end
  end

  def checked?(member)
    checks.where(member_id: member.id).exists?
  end
end
