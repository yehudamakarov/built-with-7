class User < ApplicationRecord
  has_many :identities

  def self.find_or_create_by_auth(auth_hash)
    self.where(name: auth_hash[:info][:name], email: auth_hash[:info][:email]).first_or_create do |u|
      u.name = auth_hash[:info][:name]
      u.email = auth_hash[:info][:email]
    end
  end
end
