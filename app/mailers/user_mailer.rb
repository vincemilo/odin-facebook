class UserMailer < ApplicationMailer
  default from: 'phunbaba@protonmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to Odin Facebook')
  end
end
