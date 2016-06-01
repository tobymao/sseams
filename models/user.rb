require './models/base'

class User < Base
  one_to_many :session
  one_to_one :measurement
  one_to_one :address

  def validate
    super
    validates_presence [:email, :password]
    validates_unique :email
  end

  def password
    BCrypt::Password.new(super)
  end

  def password=(new_password)
    return if new_password.empty?
    super BCrypt::Password.create(new_password)
  end
end
