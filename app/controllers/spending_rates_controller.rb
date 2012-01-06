class SpendingRatesController < ApplicationController
  before_filter :require_user
  
  # GET /spending_rates
  # GET /spending_rates.xml
  def index
    @spending_rates = SpendingRate.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @spending_rates }
    end
  end

  # GET /spending_rates/1
  # GET /spending_rates/1.xml
  def show
    @spending_rate = SpendingRate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @spending_rate }
    end
  end

  # GET /spending_rates/new
  # GET /spending_rates/new.xml
  def new
    @spending_rate = SpendingRate.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @spending_rate }
    end
  end

  # GET /spending_rates/1/edit
  def edit
    @spending_rate = SpendingRate.find(params[:id])
  end

  # POST /spending_rates
  # POST /spending_rates.xml
  def create
    @spending_rate = SpendingRate.new(params[:spending_rate])

    respond_to do |format|
      if @spending_rate.save
        format.html { redirect_to(@spending_rate, :notice => 'Spending rate was successfully created.') }
        format.xml  { render :xml => @spending_rate, :status => :created, :location => @spending_rate }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @spending_rate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /spending_rates/1
  # PUT /spending_rates/1.xml
  def update
    @spending_rate = SpendingRate.find(params[:id])

    respond_to do |format|
      if @spending_rate.update_attributes(params[:spending_rate])
        format.html { redirect_to(@spending_rate, :notice => 'Spending rate was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @spending_rate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /spending_rates/1
  # DELETE /spending_rates/1.xml
  def destroy
    @spending_rate = SpendingRate.find(params[:id])
    @spending_rate.destroy

    respond_to do |format|
      format.html { redirect_to(spending_rates_url) }
      format.xml  { head :ok }
    end
  end
end
