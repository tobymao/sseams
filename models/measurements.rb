require './models/base'

class Measurement < Base
  one_to_one :user

  def validate
    super
    validates_presence [
      :height,
      :weight,
      :neck,
      :back,
      :chest,
      :shoulder,
      :waist,
      :arm,
      :butt,
      :wrist,
      :user_id,
    ]
  end
end
