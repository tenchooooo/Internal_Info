class Schedule < ApplicationRecord
  belongs_to :member
  enum attendance: { oneday_off: 0, morning_off: 1, afternoon_off: 2, leaving_early: 3 }

  validates :day, presence: true

  def self.schedules_after_three_month
    # 今日から３カ月先までのデータを取得
    schedules = Schedule.all.where("day>= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
    # 配列を作成し、データを格納
    # DBアクセスを減らすために必要なデータを配列に突っ込んでいる。
    schedule_data = []
    schedules.each do |schedule|
      schedule_hash = {}
      schedules_hash.merge!(day: shedule.day.strftiime("%Y-%m-%d"), time: schedule.time)
      schedule_data.push(schedule_hash)
    end
    schedule_data
  end
end
