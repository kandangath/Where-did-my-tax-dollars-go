require 'spec_helper'

describe "filing_categories/show.html.erb" do
  before(:each) do
    @filing_category = assign(:filing_category, stub_model(FilingCategory,
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
