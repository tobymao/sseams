class Measurement < ActiveRecord::Base
  belongs_to :user, inverse_of: :measurement
  mount_uploader :side_image, MeasurementImageUploader
  mount_uploader :back_image, MeasurementImageUploader
  mount_uploader :front_image, MeasurementImageUploader
end
