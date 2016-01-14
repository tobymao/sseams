class UsersController < ApplicationController
  before_action :set_user, only: [:update, :destroy]

  # GET /users/new
  def new
  end

  # POST /users
  def create
    user = User.new(user_params)

    if user.save
      login_user(user)
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      login_user(@user)
    else
      redirect_to :back, flash: { error: @user.errors.messages }
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
