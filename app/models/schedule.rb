class Schedule < ApplicationRecord
  enum attendance: { oneday_off: 0, morning_off: 1, afternoon_off: 2, leaving_early: 3 }
end
