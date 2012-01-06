require "spec_helper"

describe TaxRatesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/tax_rates" }.should route_to(:controller => "tax_rates", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/tax_rates/new" }.should route_to(:controller => "tax_rates", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/tax_rates/1" }.should route_to(:controller => "tax_rates", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/tax_rates/1/edit" }.should route_to(:controller => "tax_rates", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/tax_rates" }.should route_to(:controller => "tax_rates", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/tax_rates/1" }.should route_to(:controller => "tax_rates", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/tax_rates/1" }.should route_to(:controller => "tax_rates", :action => "destroy", :id => "1")
    end

  end
end
