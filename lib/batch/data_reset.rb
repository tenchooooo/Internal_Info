class Batch::DataReset
  def self.data_reset
    # 投稿を全て削除
    Notification.where("created_at < ?", 3.days.ago.beginning_of_day).delete_all
    p "3日前の通知を全て削除しました"
  end
end