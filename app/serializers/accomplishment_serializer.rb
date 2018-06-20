class AccomplishmentSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :title, :effect, :date_time
end
