class AccomplishmentSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :title, :effect, :human_time
end
