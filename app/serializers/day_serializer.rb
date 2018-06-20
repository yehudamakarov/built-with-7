class DaySerializer < ActiveModel::Serializer
  attributes :id
  has_many :accomplishments
  
end
