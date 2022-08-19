class Public::SchedulesController < ApplicationController

  def index
    @schedules = Schedule.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
  end

end
