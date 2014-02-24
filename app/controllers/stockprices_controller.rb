class StockpricesController < ApplicationController
  before_action :set_stockprice, only: [:show, :edit, :update, :destroy]

  # GET /stockprices
  # GET /stockprices.json
  def index
    @stockprices = Stockprice.all
    response = HTTParty.get('http://api.fool.com/quotes/aol/v1/quotes/?symbols=nas:aapl&apikey=xG4BJHunaLIpzkyFhEwJqbP8yGorJYXF')
    info = response.parsed_response    

    @symbol = info['symbol']
    @price = info['price']
   end

  # GET /stockprices/1
  # GET /stockprices/1.json
  def show
  end

  # GET /stockprices/new
  def new
    @stockprice = Stockprice.new
  end

  # GET /stockprices/1/edit
  def edit
  end

  # POST /stockprices
  # POST /stockprices.json
  def create
    @stockprice = Stockprice.new(stockprice_params)

    respond_to do |format|
      if @stockprice.save
        format.html { redirect_to @stockprice, notice: 'Stockprice was successfully created.' }
        format.json { render action: 'show', status: :created, location: @stockprice }
      else
        format.html { render action: 'new' }
        format.json { render json: @stockprice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stockprices/1
  # PATCH/PUT /stockprices/1.json
  def update
    respond_to do |format|
      if @stockprice.update(stockprice_params)
        format.html { redirect_to @stockprice, notice: 'Stockprice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @stockprice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stockprices/1
  # DELETE /stockprices/1.json
  def destroy
    @stockprice.destroy
    respond_to do |format|
      format.html { redirect_to stockprices_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stockprice
      @stockprice = Stockprice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stockprice_params
      params[:stockprice]
    end
end
