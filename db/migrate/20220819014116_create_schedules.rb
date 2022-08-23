class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.date "day", null: false
      t.string "time"
      t.integer "member_id", null: false
      t.integer "attendance"
      t.string "trip"
      t.string "go_out"
      t.string "other"
      t.datetime "start_time"
      t.timestamps
    end
  end
end
