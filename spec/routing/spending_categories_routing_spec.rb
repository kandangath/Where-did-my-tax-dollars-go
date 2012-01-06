require "spec_helper"

describe SpendingCategoriesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/spending_categories" }.should route_to(:controller => "spending_categories", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/spending_categories/new" }.should route_to(:controller => "spending_categories", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/spending_categories/1" }.should route_to(:controller => "spending_categories", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/spending_categories/1/edit" }.should route_to(:controller => "spending_categories", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/spending_categories" }.should route_to(:controller => "spending_categories", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/spending_categories/1" }.should route_to(:controller => "spending_categories", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/spending_categories/1" }.should route_to(:controller => "spending_categories", :action => "destroy", :id => "1")
    end

  end
end
