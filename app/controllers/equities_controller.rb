class EquitiesController < ApplicationController
  before_action :set_equity, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index 
    @equities = current_user.equities.all

    require 'finnhub_ruby'

    FinnhubRuby.configure do |config|
      config.api_key['token'] = ENV['finhub_api']
    end
    
    @finnhub_client = FinnhubRuby::DefaultApi.new
  end

  def show

  end

  def new 
    @equity = Equity.new
  end

  def edit

  end

  def create 
    @equity = current_user.equities.build(equity_params)

    if @equity.save
      flash[:success] = "Saved!"
      redirect_to equities_path
    else 
      render 'new'
    end
  end

  def update
    @equity = Equity.find(params[:id])
    if @equity
      @equity.update(equity_params)
      flash[:success] = "Updated!"
      redirect_to equities_path
    end
  end

  def destroy
    @equity.destroy
  end

  private

    def set_equity
      @equity = Equity.find(params[:id])
    end

    def equity_params
      params.require(:equity).permit(:ticker, :buy_price, :valuation)
    end

end
