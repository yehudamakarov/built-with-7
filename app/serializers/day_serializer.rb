class DaySerializer < ActiveModel::Serializer
  attributes :id, :accomplishments

  def accomplishments
    object.accomplishments.map do |acc|
      {
        title: acc.title,
        id: acc.id,
        human_time: acc.human_time
      }
    end
  end
end
