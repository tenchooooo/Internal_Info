class Schedule < ApplicationRecord
  belongs_to :member
  enum attendance: { oneday_off: 0, morning_off: 1, afternoon_off: 2, leaving_early: 3 }
end
