class Day < ApplicationRecord
  belongs_to :user
  has_many :day_accomplishments
  has_many :accomplishments, through: :day_accomplishments


  validates_uniqueness_of :name, scope: :user_id
end
