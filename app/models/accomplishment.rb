class Accomplishment < ApplicationRecord
  has_many :day_accomplishments
  has_many :days, through: :day_accomplishments
  belongs_to :user

  def date_time_of_task_with_current_date
    DateTime.new(
      Time.zone.now.year,
      Time.zone.now.month,
      Time.zone.now.day,
      self.date_time.hour,
      self.date_time.min,
      0,
      Time.zone.now.strftime('%z')
    )
  end

  def date_find(date_time, previous_weekday)
    index_of_previous_weekday = DateTime::DAYNAMES.index(previous_weekday)
    index_of_current_weekday = date_time.wday
    if index_of_previous_weekday < index_of_current_weekday
      previous_date = date_time.days_ago(index_of_current_weekday - index_of_previous_weekday)
    else
      previous_date = date_time.days_ago(7 - (index_of_previous_weekday - index_of_current_weekday))
    end
    return previous_date
  end

  def time_of_accompmlishment
    self.date_time.strftime("%l:%M %p")
  end

end
