require 'spec_helper'

describe "tax_rates/index.html.erb" do
  before(:each) do
    assign(:tax_rates, [
      stub_model(TaxRate,
        :year => 1,
        :filing_category => "Filing Category",
        :marginal_rate => "9.99",
        :lower_limit => "9.99",
        :upper_limit => "9.99"
      ),
      stub_model(TaxRate,
        :year => 1,
        :filing_category => "Filing Category",
        :marginal_rate => "9.99",
        :lower_limit => "9.99",
        :upper_limit => "9.99"
      )
    ])
  end

  it "renders a list of tax_rates" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Filing Category".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
