class DaySerializer < ActiveModel::Serializer
  attributes :id, :accomplishments

  def accomplishments
    object.accomplishments
  end
end
