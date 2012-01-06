require 'spec_helper'

describe "filing_categories/new.html.erb" do
  before(:each) do
    assign(:filing_category, stub_model(FilingCategory,
      :name => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new filing_category form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => filing_categories_path, :method => "post" do
      assert_select "input#filing_category_name", :name => "filing_category[name]"
      assert_select "textarea#filing_category_description", :name => "filing_category[description]"
    end
  end
end
