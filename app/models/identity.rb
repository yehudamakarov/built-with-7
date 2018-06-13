class Identity < ApplicationRecord
  belongs_to :user
  validates_presence_of :uid, :provider, :user_id
  validates_uniqueness_of :uid, scope: :provider

  def self.get_or_create_identity(auth_hash, user)
    if identity = Identity.find_from_auth(auth_hash)
      return identity
    else
      identity = Identity.create_from_auth(auth_hash, user)
    end
  end

  def self.find_from_auth(auth_hash)
    Identity.find_by(uid: auth_hash[:uid], provider: auth_hash[:provider])
  end

  # this is not DOT, and this method should only be responsible for making a new Identity. The reason for this is this method is using a user argument to make identities link to a logged in user.
  def self.create_from_auth(auth_hash, user = nil)
    user ||= User.find_or_create_by_auth(auth_hash)
    self.create(user: user, uid: auth_hash[:uid], provider: auth_hash[:provider])
  end
end
