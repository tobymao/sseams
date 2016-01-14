class User < ActiveRecord::Base
  has_one :measurement, inverse_of: :user
  has_one :session, inverse_of: :user

  has_many :orders, inverse_of: :user

  validates_presence_of :email, message: "Email is required"
  validates_presence_of :password, message: "Password is required"
  validates_uniqueness_of :email, message: "Email is already registered", case_sensitive: false

  def purchased?(product)
    purchases.where(purchased: product).exists?
  end

  def password
    if pass = read_attribute(:password)
      BCrypt::Password.new(pass)
    end
  end

  def password=(new_password)
    return if new_password.empty?
    super(BCrypt::Password.create(new_password))
  end
end
