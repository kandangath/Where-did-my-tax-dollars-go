require 'spec_helper'

describe "spending_rates/index.html.erb" do
  before(:each) do
    assign(:spending_rates, [
      stub_model(SpendingRate,
        :name => "Name",
        :description => "MyText",
        :rate => "9.99",
        :spending_category_id => 1
      ),
      stub_model(SpendingRate,
        :name => "Name",
        :description => "MyText",
        :rate => "9.99",
        :spending_category_id => 1
      )
    ])
  end

  it "renders a list of spending_rates" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
