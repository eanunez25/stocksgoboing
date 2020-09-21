class ShortCallsController < ApplicationController
  before_action :set_short_call, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /short_calls
  # GET /short_calls.json
  def index
    @short_calls = current_user.short_calls.open
    @closed = current_user.short_calls.closed
  end

  # GET /short_calls/1
  # GET /short_calls/1.json
  def show
    @ceilings = [@short_call.ceiling1, @short_call.ceiling2, @short_call.strike]
    @ceiling_names = ["Celing 1", "Celing 2", "Strike"]
    if @short_call.asset == "FIVE"
      @price = 129.3
    else
      @price = 29.34    # SKX
    end
  end

  # GET /short_calls/new
  def new
    @short_call = ShortCall.new
  end

  # GET /short_calls/1/edit
  def edit
  end

  # POST /short_calls
  # POST /short_calls.json
  def create
    @short_call = current_user.short_calls.build(short_call_params)

    if @short_call.save
      flash[:success] = "Saved!"
      ApplicationMailer.new_trade(current_user, @short_call).deliver_now
      redirect_to @short_call
    else
      render 'new'
    end
  end

  # PATCH/PUT /short_calls/1
  # PATCH/PUT /short_calls/1.json
  def update
    if @short_call.update(short_call_params)
      flash[:success] = "Trade updated"
      redirect_to @short_call
    else
      render 'edit'
    end
  end

  # DELETE /short_calls/1
  # DELETE /short_calls/1.json
  def destroy
    @short_call.destroy
    flash[:success] = "Trade deleted"
    redirect_to short_calls_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_short_call
      @short_call = ShortCall.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def short_call_params
      params.require(:short_call).permit(:ceiling1, :ceiling2, :strike, :expiration, :asset, :open_comments, :close_comments)
    end

end
