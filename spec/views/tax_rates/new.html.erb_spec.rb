require 'spec_helper'

describe "tax_rates/new.html.erb" do
  before(:each) do
    assign(:tax_rate, stub_model(TaxRate,
      :year => 1,
      :filing_category => "MyString",
      :marginal_rate => "9.99",
      :lower_limit => "9.99",
      :upper_limit => "9.99"
    ).as_new_record)
  end

  it "renders new tax_rate form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => tax_rates_path, :method => "post" do
      assert_select "input#tax_rate_year", :name => "tax_rate[year]"
      assert_select "input#tax_rate_filing_category", :name => "tax_rate[filing_category]"
      assert_select "input#tax_rate_marginal_rate", :name => "tax_rate[marginal_rate]"
      assert_select "input#tax_rate_lower_limit", :name => "tax_rate[lower_limit]"
      assert_select "input#tax_rate_upper_limit", :name => "tax_rate[upper_limit]"
    end
  end
end
