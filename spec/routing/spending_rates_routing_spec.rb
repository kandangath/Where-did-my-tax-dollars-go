require "spec_helper"

describe SpendingRatesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/spending_rates" }.should route_to(:controller => "spending_rates", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/spending_rates/new" }.should route_to(:controller => "spending_rates", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/spending_rates/1" }.should route_to(:controller => "spending_rates", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/spending_rates/1/edit" }.should route_to(:controller => "spending_rates", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/spending_rates" }.should route_to(:controller => "spending_rates", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/spending_rates/1" }.should route_to(:controller => "spending_rates", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/spending_rates/1" }.should route_to(:controller => "spending_rates", :action => "destroy", :id => "1")
    end

  end
end
