require 'spec_helper'

describe "spending_categories/new.html.erb" do
  before(:each) do
    assign(:spending_category, stub_model(SpendingCategory,
      :name => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new spending_category form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => spending_categories_path, :method => "post" do
      assert_select "input#spending_category_name", :name => "spending_category[name]"
      assert_select "textarea#spending_category_description", :name => "spending_category[description]"
    end
  end
end
