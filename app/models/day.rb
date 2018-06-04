class Day < ApplicationRecord
  belongs_to :user
  has_many :day_accomplishments
  has_many :accomplishments, through: :day_accomplishments


  validates_uniqueness_of :name, scope: :user_id

  def user_unique_link
    self.user.full_name + "\'s " + self.name
  end
end
