class Day < ApplicationRecord
  belongs_to :user
  has_many :day_accomplishments
  has_many :accomplishments, through: :day_accomplishments


  validates_uniqueness_of :name, scope: :user_id

  def user_unique_link
    self.user.full_name + "\'s " + self.name
  end

  def accomplishments_by_day
    self.accomplishments.order(Arel.sql('time(date_time) asc'))
  end
end
