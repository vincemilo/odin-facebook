class UserMailer < ApplicationMailer
  default from: 'phunbaba@protonmail.com'

  def welcome_email(user)
    @user = user
    @url  = root_url
    mail(to: @user.email, subject: 'Welcome to Odin Facebook')
  end
end
