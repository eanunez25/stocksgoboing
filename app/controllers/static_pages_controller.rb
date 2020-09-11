class StaticPagesController < ApplicationController

  def home
    @bull_put_spreads = current_user.bull_put_spreads.all if user_signed_in? 
    @short_puts = current_user.short_puts.all if user_signed_in?
  end

end
