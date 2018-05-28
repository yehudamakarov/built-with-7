class User < ApplicationRecord
  has_many :identities

  has_secure_password

  validates :password, confirmation: true
  validates :password_confirmation, presence: true, unless: :skip_password_confirmation_validation

  validates_uniqueness_of :email, {case_sensitive: false}

  attr_accessor :skip_password_confirmation_validation

  def self.find_or_create_by_auth(auth_hash)
    @user = self.where(email: auth_hash[:info][:email]).first_or_initialize.tap do |u|
      u.first_name = first_name_from_full_name(auth_hash[:info][:name])
      u.last_name = last_name_from_full_name(auth_hash[:info][:name])
      u.email = auth_hash[:info][:email]
      #
      #
      #
      u.skip_password_confirmation_validation = true
      # stuck. has_secure_password requires a password, but making a user with an auth_hash shouldn't need a password.
      binding.pry
      #
      #
      #
      u.save
    end
  end

  def self.create_from_signup(signup_params)
    @user = User.create(signup_params)
  end

  def self.first_name_from_full_name(full_name)
    full_name.split(' ')[0..-2].join(' ')
  end

  def self.last_name_from_full_name(full_name)
    full_name.split(' ')[-1]
  end

end
