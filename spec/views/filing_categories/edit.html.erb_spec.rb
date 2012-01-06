require 'spec_helper'

describe "filing_categories/edit.html.erb" do
  before(:each) do
    @filing_category = assign(:filing_category, stub_model(FilingCategory,
      :new_record? => false,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit filing_category form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => filing_category_path(@filing_category), :method => "post" do
      assert_select "input#filing_category_name", :name => "filing_category[name]"
      assert_select "textarea#filing_category_description", :name => "filing_category[description]"
    end
  end
end
