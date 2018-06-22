class AccomplishmentSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :title, :effect, :human_time, :since, :days


  def since
    object.human_date_time
  end

  def days
    object.days
  end
end
