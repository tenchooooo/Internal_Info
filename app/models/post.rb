class Post < ApplicationRecord
   has_one_attached :image
   has_many :post_tags,dependent: :destroy
   has_many :tags,through: :post_tags
   
   def save_tag(sent_tags)
    # タグが存在していれば、タグの名前を配列としてすべて取得(unless~「タグが存在してるか？」)
    # 「plunkメソッド」は、カラムの中身を展開
    current_tags = self.tags.plunk(:name) unless self.tags.nil?
    # 現在取得したタグから送られてきたタグを除いてoldtagとする
    # 今あるタグ－新たに送られてきたタグ
    old_tags = current_tags - sent_tags
    # 送信されてきたタグから現在存在るるタグを除いたタグをnewとする
    new_tags = sent_tags - current_tags
    
    # 古いタグを消す
    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end
    
    # 新しいタグを取得
    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(name: new)
      self.tags << new_post_tag
    end
   end
end
