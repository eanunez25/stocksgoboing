class StaticPagesController < ApplicationController

  def home
    @bull_put_spreads = current_user.bull_put_spreads.where('expiration > ?', Date.today) if user_signed_in? 
    @short_puts = current_user.short_puts.where('expiration > ?', Date.today) if user_signed_in?
    @bear_call_spreads = current_user.bear_call_spreads.where('expiration > ?', Date.today) if user_signed_in?
    @short_calls = current_user.short_calls.where('expiration > ?', Date.today) if user_signed_in?
  end

end
