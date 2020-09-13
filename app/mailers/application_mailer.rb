class ApplicationMailer < ActionMailer::Base
  default from: "stocksgoboing@gmail.com"
  layout 'mailer'

  def new_trade
    @user = params[:user]
    mail to: @user.email, subject: "New Trade"
  end
  
end
