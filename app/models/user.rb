class User < ApplicationRecord
  has_many :identities

  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates_uniqueness_of :email, {case_sensitive: false}
  validates_presence_of :email, :first_name, :last_name

  has_secure_password validations: false
  validates :password, presence: true, unless: :skip_password_validation
  validates :password, confirmation: true
  validates :password_confirmation, presence: true, unless: :skip_password_validation

  attr_accessor :skip_password_validation

  has_many :days
  has_many :day_accomplishments, through: :days
  has_many :accomplishments, through: :day_accomplishments



  def self.find_or_create_by_auth(auth_hash)
    @user = self.where(email: auth_hash[:info][:email]).first_or_initialize.tap do |u|
      u.first_name = first_name_from_full_name(auth_hash[:info][:name])
      u.last_name = last_name_from_full_name(auth_hash[:info][:name])
      u.email = auth_hash[:info][:email]
      u.skip_password_validation = true
      u.days.build(name: 'Sunday')
      u.days.build(name: 'Monday')
      u.days.build(name: 'Tuesday')
      u.days.build(name: 'Wednesday')
      u.days.build(name: 'Thursday')
      u.days.build(name: 'Friday')
      u.days.build(name: 'Saturday')
      u.save
    end
  end

  def self.create_from_signup(signup_params)
    @user = User.new(signup_params)
    if @user.save
      @user.days.create(name: 'Sunday')
      @user.days.create(name: 'Monday')
      @user.days.create(name: 'Tuesday')
      @user.days.create(name: 'Wednesday')
      @user.days.create(name: 'Thursday')
      @user.days.create(name: 'Friday')
      @user.days.create(name: 'Saturday')
    end
    @user
  end

  def self.first_name_from_full_name(full_name)
    full_name.split(' ')[0..-2].join(' ')
  end

  def self.last_name_from_full_name(full_name)
    full_name.split(' ')[-1]
  end

  def sunday
    self.days.find_by(name: 'Sunday')
  end

  def monday
    self.days.find_by(name: 'Monday')
  end

  def tuesday
    self.days.find_by(name: 'Tuesday')
  end

  def wednesday
    self.days.find_by(name: 'Wednesday')
  end

  def thursday
    self.days.find_by(name: 'Thursday')
  end

  def friday
    self.days.find_by(name: 'Friday')
  end

  def saturday
    self.days.find_by(name: 'Saturday')
  end

  def full_name
    self.first_name + ' ' + self.last_name
  end

end
