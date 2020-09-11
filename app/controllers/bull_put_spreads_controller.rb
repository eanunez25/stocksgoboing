class BullPutSpreadsController < ApplicationController
  before_action :set_bull_put_spread, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /bull_put_spreads
  # GET /bull_put_spreads.json
  def index
    @bull_put_spreads = current_user.bull_put_spreads.all
  end

  # GET /bull_put_spreads/1
  # GET /bull_put_spreads/1.json
  def show
    @floors = [@bull_put_spread.floor1, @bull_put_spread.floor2, @bull_put_spread.strike]
    @floor_names = ["Floor 1", "Floor 2", "Strike"]
    @rut_price = 1526.48
  end

  # GET /bull_put_spreads/new
  def new
    @bull_put_spread = BullPutSpread.new
  end

  # GET /bull_put_spreads/1/edit
  def edit
  end

  # POST /bull_put_spreads
  # POST /bull_put_spreads.json
  def create
    @bull_put_spread = current_user.bull_put_spreads.build(bull_put_spread_params)

    if @bull_put_spread.save
      flash[:success] = "Saved!"
      redirect_to @bull_put_spread
    else
      render 'new'
    end
  end

  # PATCH/PUT /bull_put_spreads/1
  # PATCH/PUT /bull_put_spreads/1.json
  def update
    if @bull_put_spread.update(bull_put_spread_params)
      flash[:success] = "Trade updated"
      redirect_to @bull_put_spread
    else
      render 'edit'
    end
  end

  # DELETE /bull_put_spreads/1
  # DELETE /bull_put_spreads/1.json
  def destroy
    @bull_put_spread.destroy
    flash[:success] = "Trade deleted"
    redirect_to bull_put_spreads_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bull_put_spread
      @bull_put_spread = BullPutSpread.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bull_put_spread_params
      params.require(:bull_put_spread).permit(:floor1, :floor2, :strike, :expiration, :asset)
    end
end
