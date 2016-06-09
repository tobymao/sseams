require './models/base'
require './uploaders/measurement_uploader'

class Measurement < Base
  include MeasurementUploader[:front_image]
  include MeasurementUploader[:back_image]
  include MeasurementUploader[:side_image]

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
