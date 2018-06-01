class Accomplishment < ApplicationRecord
  has_many :day_accomplishments
  has_many :days, through: :day_accomplishments
  belongs_to :user


end
