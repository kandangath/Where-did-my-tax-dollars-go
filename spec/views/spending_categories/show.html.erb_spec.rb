require 'spec_helper'

describe "spending_categories/show.html.erb" do
  before(:each) do
    @spending_category = assign(:spending_category, stub_model(SpendingCategory,
      :name => "Name",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
