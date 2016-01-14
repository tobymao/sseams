class MeasurementsController < ApplicationController
  before_action :authenticate

  DEFAULT_FEET   = 60
  DEFAULT_POUNDS = 150

  # GET /measurements
  def index
    @measurement = current_user.measurement || Measurement.new(user: current_user)
    @measurement.weight ||= DEFAULT_POUNDS
    @measurement.height ||= DEFAULT_FEET
  end

  # POST /measurements
  def create
    @measurement = Measurement.new(measurement_params)

    if @measurement.save
      redirect_to measurements_path, notice: 'Measurements saved'
    else
      redirect_to measurements_path, error: @measurement.errors.messages
    end
  end

  # PATCH/PUT /measurements/1
  def update
    @measurement = Measurement.find(params[:id])

    if @measurement.update(measurement_params)
      redirect_to measurements_path, notice: 'Measurements saved'
    else
      redirect_to measurements_path, error: @measurement.errors.messages
    end
  end

  private
  def measurement_params
    params.require(:measurement).permit(
      :user_id,
      :height,
      :weight,
      :neck,
      :butt,
      :arm,
      :chest,
      :back,
      :wrist,
      :waist,
      :shoulder,
      :front_image,
      :back_image,
      :side_image,
    )
  end
end
