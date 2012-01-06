require "spec_helper"

describe FilingCategoriesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/filing_categories" }.should route_to(:controller => "filing_categories", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/filing_categories/new" }.should route_to(:controller => "filing_categories", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/filing_categories/1" }.should route_to(:controller => "filing_categories", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/filing_categories/1/edit" }.should route_to(:controller => "filing_categories", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/filing_categories" }.should route_to(:controller => "filing_categories", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/filing_categories/1" }.should route_to(:controller => "filing_categories", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/filing_categories/1" }.should route_to(:controller => "filing_categories", :action => "destroy", :id => "1")
    end

  end
end
