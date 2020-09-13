class BullPutSpreadMailer < ApplicationMailer

  def new_trade
    @user = params[:user]
    mail to: @user.email, subject: "New Trade"
  end

end
