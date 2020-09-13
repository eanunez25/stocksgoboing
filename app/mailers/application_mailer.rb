class ApplicationMailer < ActionMailer::Base
  default from: "stocksgoboing@gmail.com"
  layout 'mailer'

  def new_trade(user, trade)
    @user = user
    @trade = trade
    mail to: @user.email, subject: "New Trade"
  end

end
