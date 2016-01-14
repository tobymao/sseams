class LoginMailer < ApplicationMailer
  include Rails.application.routes.url_helpers

  def password_email(user, password_reset)
    params = {token: password_reset.token}
    mail(
      to: user.email,
      subject: "Seven Seams Password Reset",
      body: "Click this link to reset your password. #{reset_password_url(params)}"
    )
  end
end
