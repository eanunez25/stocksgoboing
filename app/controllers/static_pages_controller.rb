class StaticPagesController < ApplicationController

  def home
    @bull_put_spreads = current_user.bull_put_spreads.all if user_signed_in? 
    @short_puts = current_user.short_puts.all if user_signed_in?
    @bear_call_spreads = current_user.bear_call_spreads.all if user_signed_in?
    @short_calls = current_user.short_calls.all if user_signed_in?
    @trade = @bull_put_spreads.size + @short_puts.size + @bear_call_spreads.size + @short_calls.size
  end

end
