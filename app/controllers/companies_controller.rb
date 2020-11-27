class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /companies
  # GET /companies.json
  def index
    @companies = current_user.companies.all.order(:ticker)
    @comments = current_user.comments.all.order('created_at DESC')
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @companies = current_user.companies.all.order(:ticker)
    @comments = @company.comments.all.order('created_at DESC')
    @comment = Comment.new

    require 'finnhub_ruby'

    FinnhubRuby.configure do |config|
      config.api_key['token'] = ENV['finhub_api']
    end
    
    finnhub_client = FinnhubRuby::DefaultApi.new

    ticker = @company.ticker
    @price = finnhub_client.quote(ticker).c
    @name = finnhub_client.company_profile2({symbol: ticker}).name
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = current_user.companies.build(company_params)

    if @company.save
      flash[:success] = "Saved!"
      redirect_to companies_path
    else
      render 'new'
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    if @company.update(company_params)
      flash[:success] = "Company updated!"
      redirect_to @company
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    flash[:success] = "Company deleted!"
    redirect_to companies_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def company_params
      params.require(:company).permit(:ticker)
    end
end
