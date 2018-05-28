class User < ApplicationRecord
  has_many :identities

  def self.find_or_create_by_auth(auth_hash)
    self.find_or_create_by(name: auth_hash[:name], email: auth_hash[:email])
  end
end
