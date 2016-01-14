class LoginController < ApplicationController
  # GET /login
  def index
  end

  # GET /login/new
  def new
  end

  # GET /login/reset
  def reset
    @password_reset = PasswordReset.find_by(token: params[:token])
  end

  # POST /login
  def login
    user = User.find_by(email: login_params[:email])

    if !user || user.password != login_params[:password]
      redirect_to :back
    else
      login_user(user)
    end
  end

  # POST /login/logout
  def logout
    Session.where(user: current_user).destroy_all
    redirect_to root_path
  end

  # POST /login/reset
  def reset_password
    user = User.find_by(email: params[:email])

    if !user
      redirect_to :back, flash: {error: "This email is not registered"}
    else
      password_reset = PasswordReset.create(user: user, token: SecureRandom.hex)
      PasswordMailer.password_email(user, password_reset).deliver_now
      redirect_to :back, notice: "Password Reset Link sent to #{user.email}"
    end
  end

  private
  def login_params
    params.require(:login).permit(:email, :password)
  end
end
