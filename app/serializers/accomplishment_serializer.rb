class AccomplishmentSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :title, :effect, :human_time, :since

  def since
    object.human_date_time
  end
  
end
