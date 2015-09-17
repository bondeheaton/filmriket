class UserMailer < Devise::Mailer
default from: "mikael.lisselgard@gmail.com"


  def parent_email(user)
    @user = user
    @url  = 'localhost:3000/login'
    mail(to: @user.parentmail, subject: 'Welcome to My Awesome Site')
  end

end
