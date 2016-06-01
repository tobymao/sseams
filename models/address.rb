require './models/base'

class Address < Base
  one_to_one :user

  def validate
    super
    validates_presence [
      :name,
      :street,
      :city,
      :state,
      :zip,
      :user_id,
    ]
  end
end
