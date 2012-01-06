require 'spec_helper'

describe "spending_categories/edit.html.erb" do
  before(:each) do
    @spending_category = assign(:spending_category, stub_model(SpendingCategory,
      :new_record? => false,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit spending_category form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => spending_category_path(@spending_category), :method => "post" do
      assert_select "input#spending_category_name", :name => "spending_category[name]"
      assert_select "textarea#spending_category_description", :name => "spending_category[description]"
    end
  end
end
