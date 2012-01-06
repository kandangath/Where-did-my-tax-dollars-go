require 'spec_helper'

describe "spending_rates/edit.html.erb" do
  before(:each) do
    @spending_rate = assign(:spending_rate, stub_model(SpendingRate,
      :new_record? => false,
      :name => "MyString",
      :description => "MyText",
      :rate => "9.99",
      :spending_category_id => 1
    ))
  end

  it "renders the edit spending_rate form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => spending_rate_path(@spending_rate), :method => "post" do
      assert_select "input#spending_rate_name", :name => "spending_rate[name]"
      assert_select "textarea#spending_rate_description", :name => "spending_rate[description]"
      assert_select "input#spending_rate_rate", :name => "spending_rate[rate]"
      assert_select "input#spending_rate_spending_category_id", :name => "spending_rate[spending_category_id]"
    end
  end
end
