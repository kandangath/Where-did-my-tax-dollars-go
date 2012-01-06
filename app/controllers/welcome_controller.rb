class WelcomeController < ApplicationController
 
  before_filter :require_user, :only => [ :admin ]
  
  include ApplicationHelper
  include ChartHelper
  
  def index
    @tax_payer = TaxPayer.new
    @tax_payer.income = 50000 # Set default
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tax_payer }
    end
  end
  
  def spending
    # Check whether we are responding to a get or a post request
    if params[:tax_payer].nil?
      if params[:fcat].nil? or params[:inc].nil? or (params[:fcat].to_i <= 0)
        redirect_to :root and return # GET request with incomplete params
      else
        @income = params[:inc].to_i
        _fcat = params[:fcat]
      end
    else
      @income = params[:tax_payer]['income'].to_i
      _fcat = params[:tax_payer]['filing_category']
    end    
    
    
    begin
      filing_category = FilingCategory.find_by_id(_fcat, 
                                                  :include => :tax_rates, 
                                                  :conditions => ["tax_rates.year = ?", APP_CONFIG[:tax_year]]
                                                  )
      @standard_deduction = filing_category.standard_deduction
      @income_tax, @tax_brackets = calculate_taxes(@income, filing_category)
      @fica_rates = FicaTaxRate.find_by_year(APP_CONFIG[:tax_year])
      @oasdi_tax = calculate_oasdi_tax(@income, @fica_rates)
      @hi_tax = calculate_hi_tax(@income, @fica_rates)
      
      @spending_categories = SpendingCategory.find(:all, :joins => :spending_rates,
                                                    :conditions => ["spending_rates.year = ?", APP_CONFIG[:tax_year]],
                                                    :select => "spending_categories.id, spending_categories.name, spending_categories.description, SUM(CASE WHEN spending_rates.amount > 0 THEN spending_rates.amount ELSE 0 END) AS amount_sum",
                                                    :group => "spending_categories.id, spending_categories.name, spending_categories.description",
                                                    :order => "spending_categories.name DESC",
                                                    :include => :spending_rates)
      @total_spending = @spending_categories.inject(0){|sum,x| sum + x[:amount_sum].to_f} # sum all the expenses over all categories
      # Create TaxPayer object for the form on this page
      @tax_payer = TaxPayer.new
      # Uncomment these two lines if the previous selection in the TaxPayer form is to be remembered. Income may be overridden by the form default
      @tax_payer.income = @income.to_s
      @tax_payer.filing_category = _fcat
      @tax_payer.filing_category_name = filing_category.name
    rescue Exception => exc
      logger.error("!!!ERROR!!! #{exc.message} #{exc.backtrace.inspect}")
      redirect_to :root
    end
  end
  
  def admin
    # render admin welcome template
  end
  
  def credits
    # render template
  end
  
  def sources
    @spending_categories = SpendingCategory.find(:all, :joins => :spending_rates,
                                                  :conditions => ["spending_rates.year = ?", APP_CONFIG[:tax_year]],
                                                  :select => "spending_categories.id, spending_categories.name, spending_categories.description, SUM(spending_rates.amount) AS amount_sum",
                                                  :group => "spending_categories.id, spending_categories.name, spending_categories.description",
                                                  :order => "spending_categories.name DESC")
    # render template
  end
  
  def landing
    #This is the page that will be shown when the site is being worked upon
  end

end
