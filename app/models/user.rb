class User < ApplicationRecord
  has_many :identities
  has_secure_password
  validates :password, confirmation: true
  validates :email_confirmation, presence: true
  validates_uniqueness_of :email, {case_sensitive: false}

  def self.find_or_create_by_auth(auth_hash)
    self.where(email: auth_hash[:info][:email]).first_or_create do |u|
      u.first_name = first_name_from_full_name(auth_hash[:info][:name])
      u.last_name = last_name_from_full_name(auth_hash[:info][:name])
      u.email = auth_hash[:info][:email]
    end
  end

  def self.create_from_signup(signup_params)
    @user = User.create do |u|
      u.first_name = first_name_from_full_name(signup_params[:name])
      u.last_name = last_name_from_full_name(signup_params[:name])
      u.email = signup_params[:email]
      u.password = signup_params[:password]
    end
  end

  def first_name_from_full_name(full_name)
    fullname.split(' ')[0..-2]
  end

  def last_name_from_full_name(full_name)
    full_name.split(' ')[-1]
  end

end
