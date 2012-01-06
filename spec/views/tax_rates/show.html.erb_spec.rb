require 'spec_helper'

describe "tax_rates/show.html.erb" do
  before(:each) do
    @tax_rate = assign(:tax_rate, stub_model(TaxRate,
      :year => 1,
      :filing_category => "Filing Category",
      :marginal_rate => "9.99",
      :lower_limit => "9.99",
      :upper_limit => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Filing Category/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/9.99/)
  end
end
