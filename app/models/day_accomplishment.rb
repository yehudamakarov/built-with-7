class DayAccomplishment < ApplicationRecord
  belongs_to :day
  belongs_to :accomplishment
end
