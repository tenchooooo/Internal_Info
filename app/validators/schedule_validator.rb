class ScheduleValidator < ActiveModel::Validator
  def validate(record)
    items = [record attendance, record.trip, record.go_out, record.other]
    return if items.any?(:present?)
    record.errors[:base] << '予定を選択してください。'
  end
end