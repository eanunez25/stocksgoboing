class ShortPutsController < ApplicationController
  before_action :set_short_put, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /short_puts
  # GET /short_puts.json
  def index
    @short_puts = current_user.short_puts.open
    @closed = current_user.short_puts.closed
  end

  # GET /short_puts/1
  # GET /short_puts/1.json
  def show
    require 'finnhub_ruby'

    FinnhubRuby.configure do |config|
      config.api_key['token'] = ENV['finhub_api']
    end
    
    finnhub_client = FinnhubRuby::DefaultApi.new

    ticker = @short_put.asset
    @price = finnhub_client.quote(ticker).c

    @floors = [@short_put.floor1, @short_put.floor2, @short_put.strike]
    @floor_names = ["Floor 1", "Floor 2", "Strike"]

  end

  # GET /short_puts/new
  def new
    @short_put = ShortPut.new
  end

  # GET /short_puts/1/edit
  def edit
  end

  # POST /short_puts
  # POST /short_puts.json
  def create
    @short_put = current_user.short_puts.build(short_put_params)

    if @short_put.save
      flash[:success] = "Saved!"
      ApplicationMailer.new_trade(current_user, @short_put).deliver_now
      redirect_to @short_put
    else
      render 'new'
    end
  end

  # PATCH/PUT /short_puts/1
  # PATCH/PUT /short_puts/1.json
  def update
    if @short_put.update(short_put_params)
      flash[:success] = "Trade updated!"
      redirect_to @short_put
    end
  end

  # DELETE /short_puts/1
  # DELETE /short_puts/1.json
  def destroy
    @short_put.destroy
    flash[:success] = "Trade deleted!"
    redirect_to short_puts_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_short_put
      @short_put = ShortPut.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def short_put_params
      params.require(:short_put).permit(:floor1, :floor2, :strike, :expiration, :asset.upcase, :open_comments, :close_comments)
    end
end
