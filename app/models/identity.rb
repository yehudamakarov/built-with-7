class Identity < ApplicationRecord
  belongs_to :user
  validates_presence_of :uid, :provider, :user_id
  validates_uniqueness_of :uid, scope: :provider

  def self.find_from_auth(auth_hash)
    Identity.find_by(uid: auth_hash[:uid], provider: auth_hash[:provider])
  end

  def self.create_from_auth(auth_hash, user = nil)
    user ||= User.find_or_create_by_auth(auth_hash)
    self.create(user: user, uid: auth_hash[:uid], provider: auth_hash[:provider])
  end
end
