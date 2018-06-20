class Accomplishment < ApplicationRecord
  default_scope { order(Arel.sql('time(date_time) asc')) }
  has_many :day_accomplishments
  has_many :days, through: :day_accomplishments
  belongs_to :user

  validates :title, uniqueness: { case_sensitive: false }, presence: true

  # Sets the date_time of the accomplishment to the last occuring weekday specified on the form, using the time of day specified by the form.
  def self.new_from_params(params, user)
    self.new(params) do |a|
      current_datetime = a.date_time_of_task_with_current_date
      a.date_time = a.date_find(current_datetime, params[:day])
      a.user = user
      if a.days.empty?
        a.days << a.user.days.find_by(name: params[:day])
      end
    end
  end

  def update_from_params(params)
    self.assign_attributes(params)
    day_of_week = self.user.days.find_by(name: self.date_time.strftime('$A'))
    self.day = day_of_week.name
    if self.days.empty?
      self.days << day_of_week
    end
  end

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
    self.date_time.strftime('%l:%M %p')
  end

  def human_date_time
    self.date_time.strftime('%A, %B %e, at %l:%M %p')
  end

  def list_days
    self.days.map { |d| d.name }.join(', ')
  end

end
