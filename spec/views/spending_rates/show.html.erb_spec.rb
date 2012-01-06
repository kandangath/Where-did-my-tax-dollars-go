require 'spec_helper'

describe "spending_rates/show.html.erb" do
  before(:each) do
    @spending_rate = assign(:spending_rate, stub_model(SpendingRate,
      :name => "Name",
      :description => "MyText",
      :rate => "9.99",
      :spending_category_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
