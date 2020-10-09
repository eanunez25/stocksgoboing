class BearCallSpreadsController < ApplicationController
  before_action :set_bear_call_spread, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /bear_call_spreads
  # GET /bear_call_spreads.json
  def index
    @bear_call_spreads = current_user.bear_call_spreads.open
    @closed = current_user.bear_call_spreads.closed
  end

    # GET /bear_call_spreads/1
  # GET /bear_call_spreads/1.json
  def show
    @ceilings = [@bear_call_spread.ceiling1, @bear_call_spread.ceiling2, @bear_call_spread.strike]
    @ceiling_names = ["Celing 1", "Celing 2", "Strike"]
    @rut_price = 1539.3
  end

  # GET /bear_call_spreads/new
  def new
    @bear_call_spread = BearCallSpread.new
  end

  # GET /bear_call_spreads/1/edit
  def edit
  end

  # POST /bear_call_spreads
  # POST /bear_call_spreads.json
  def create
    @bear_call_spread = current_user.bear_call_spreads.build(bear_call_spread_params)

    if @bear_call_spread.save
      flash[:success] = "Saved!"
      # ApplicationMailer.new_trade(current_user, @bear_call_spread).deliver_now
      redirect_to @bear_call_spread
    else
      render 'new'
    end
  end

  # PATCH/PUT /bear_call_spreads/1
  # PATCH/PUT /bear_call_spreads/1.json
  def update
    if @bear_call_spread.update(bear_call_spread_params)
      flash[:success] = "Trade updated"
      redirect_to @bear_call_spread
    else
      render 'edit'
    end
  end

  # DELETE /bear_call_spreads/1
  # DELETE /bear_call_spreads/1.json
  def destroy
    @bear_call_spread.destroy
    flash[:success] = "Trade deleted"
    redirect_to bear_call_spreads_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bear_call_spread
      @bear_call_spread = BearCallSpread.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bear_call_spread_params
      params.require(:bear_call_spread).permit(:ceiling1, :ceiling2, :strike, :expiration, :asset, :open_comments, :close_comments)
    end

end
