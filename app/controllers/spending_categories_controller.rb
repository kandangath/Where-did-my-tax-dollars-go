class SpendingCategoriesController < ApplicationController
  before_filter :require_user
  
  # GET /spending_categories
  # GET /spending_categories.xml
  def index
    @spending_categories = SpendingCategory.find(:all, :joins => :spending_rates,
                                                  :conditions => ["spending_rates.year = ?", APP_CONFIG[:tax_year]],
                                                  :select => "spending_categories.id, spending_categories.name, spending_categories.description, SUM(spending_rates.amount) AS amount_sum",
                                                  :group => "spending_categories.id, spending_categories.name, spending_categories.description")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @spending_categories }
    end
  end

  # GET /spending_categories/1
  # GET /spending_categories/1.xml
  def show
    @spending_category = SpendingCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @spending_category }
    end
  end

  # GET /spending_categories/new
  # GET /spending_categories/new.xml
  def new
    @spending_category = SpendingCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @spending_category }
    end
  end

  # GET /spending_categories/1/edit
  def edit
    @spending_category = SpendingCategory.find(params[:id])
  end

  # POST /spending_categories
  # POST /spending_categories.xml
  def create
    @spending_category = SpendingCategory.new(params[:spending_category])

    respond_to do |format|
      if @spending_category.save
        format.html { redirect_to(@spending_category, :notice => 'Spending category was successfully created.') }
        format.xml  { render :xml => @spending_category, :status => :created, :location => @spending_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @spending_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /spending_categories/1
  # PUT /spending_categories/1.xml
  def update
    @spending_category = SpendingCategory.find(params[:id])

    respond_to do |format|
      if @spending_category.update_attributes(params[:spending_category])
        format.html { redirect_to(@spending_category, :notice => 'Spending category was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @spending_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /spending_categories/1
  # DELETE /spending_categories/1.xml
  def destroy
    @spending_category = SpendingCategory.find(params[:id])
    @spending_category.destroy

    respond_to do |format|
      format.html { redirect_to(spending_categories_url) }
      format.xml  { head :ok }
    end
  end
end
