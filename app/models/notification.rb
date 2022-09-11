class Notification < ApplicationRecord
  default_scope -> { order(created_at: :desc) }   # デフォルトの並び順を「作成日時の降順」で指定　→　常に新しい通知からデータを取得
  belongs_to :post, optional: true

  belongs_to :visitor, class_name: 'Member', foreign_key: 'visitor_id', optional: true# optional: trueは、nilを許可するもの
  belongs_to :visited, class_name: 'Member', foreign_key: 'visited_id', optional: true
end
