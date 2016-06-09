class MeasurementUploader < Shrine
  MAX_SIZE_MB = 10

  Attacher.validate do
    validate_max_size MAX_SIZE_MB*1024*1024
  end
end
