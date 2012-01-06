require 'spec_helper'

describe "spending_categories/index.html.erb" do
  before(:each) do
    assign(:spending_categories, [
      stub_model(SpendingCategory,
        :name => "Name",
        :description => "MyText"
      ),
      stub_model(SpendingCategory,
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of spending_categories" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
