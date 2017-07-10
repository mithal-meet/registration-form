class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  #layout 'mailer'

  def welcome_email(leave)
  	@user = User.find(leave.user_id)
    @admint = User.where(:admin => true)
    @adminp =@admint[0]
    @url  = 'http://localhost:3000/leaves'
    mail(from: @user.email , to: @adminp.email, subject: 'applied for leave')
  end

	  def approve_user(user)
  	@user = user
    @admint = User.where(:admin => true)
    @adminp =@admint[0]
    #@url  = 'http://example.com/login'
    mail(from: @user.email , to: @adminp.email, subject: 'user approval')
  end

   def approve_leave_mail(leave)
      @user = User.find(leave.user_id)
    @admint = User.where(:admin => true)
    @adminp =@admint[0]
    #@url  = 'http://example.com/login'
    mail(from: @adminp.email , to: @user.email, subject: 'user approval')
  end

end
