class StaticPagesController < ApplicationController

  def home
    @bull_put_spreads = current_user.bull_put_spreads.where('expiration >= ?', Date.today).order('created_at ASC') if user_signed_in? 
    @short_puts = current_user.short_puts.where('expiration >= ?', Date.today).order('created_at ASC') if user_signed_in?
    @bear_call_spreads = current_user.bear_call_spreads.where('expiration >= ?', Date.today).order('created_at ASC') if user_signed_in?
    @short_calls = current_user.short_calls.where('expiration >= ?', Date.today).order('created_at ASC') if user_signed_in?
  end

  def covid
    require 'finnhub_ruby'

    FinnhubRuby.configure do |config|
      config.api_key['token'] = ENV['finhub_api']
    end
    
    finnhub_client = FinnhubRuby::DefaultApi.new
    @states = finnhub_client.covid19().sort_by { |st| st.state }
  end

  def rut
    s = File.read("rut.json")
    probabilities = JSON.parse(s)
    @probabilities = probabilities["JSON"]
  end

end
