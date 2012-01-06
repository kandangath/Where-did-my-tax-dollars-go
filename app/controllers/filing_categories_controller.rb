class FilingCategoriesController < ApplicationController
  before_filter :require_user
  
  # GET /filing_categories
  # GET /filing_categories.xml
  def index
    @filing_categories = FilingCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @filing_categories }
    end
  end

  # GET /filing_categories/1
  # GET /filing_categories/1.xml
  def show
    @filing_category = FilingCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @filing_category }
    end
  end

  # GET /filing_categories/new
  # GET /filing_categories/new.xml
  def new
    @filing_category = FilingCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @filing_category }
    end
  end

  # GET /filing_categories/1/edit
  def edit
    @filing_category = FilingCategory.find(params[:id])
  end

  # POST /filing_categories
  # POST /filing_categories.xml
  def create
    @filing_category = FilingCategory.new(params[:filing_category])

    respond_to do |format|
      if @filing_category.save
        format.html { redirect_to(@filing_category, :notice => 'Filing category was successfully created.') }
        format.xml  { render :xml => @filing_category, :status => :created, :location => @filing_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @filing_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /filing_categories/1
  # PUT /filing_categories/1.xml
  def update
    @filing_category = FilingCategory.find(params[:id])

    respond_to do |format|
      if @filing_category.update_attributes(params[:filing_category])
        format.html { redirect_to(@filing_category, :notice => 'Filing category was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @filing_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /filing_categories/1
  # DELETE /filing_categories/1.xml
  def destroy
    @filing_category = FilingCategory.find(params[:id])
    @filing_category.destroy

    respond_to do |format|
      format.html { redirect_to(filing_categories_url) }
      format.xml  { head :ok }
    end
  end
end
