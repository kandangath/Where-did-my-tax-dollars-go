require 'spec_helper'

describe SpendingRatesController do

  def mock_spending_rate(stubs={})
    (@mock_spending_rate ||= mock_model(SpendingRate).as_null_object).tap do |spending_rate|
      spending_rate.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all spending_rates as @spending_rates" do
      SpendingRate.stub(:all) { [mock_spending_rate] }
      get :index
      assigns(:spending_rates).should eq([mock_spending_rate])
    end
  end

  describe "GET show" do
    it "assigns the requested spending_rate as @spending_rate" do
      SpendingRate.stub(:find).with("37") { mock_spending_rate }
      get :show, :id => "37"
      assigns(:spending_rate).should be(mock_spending_rate)
    end
  end

  describe "GET new" do
    it "assigns a new spending_rate as @spending_rate" do
      SpendingRate.stub(:new) { mock_spending_rate }
      get :new
      assigns(:spending_rate).should be(mock_spending_rate)
    end
  end

  describe "GET edit" do
    it "assigns the requested spending_rate as @spending_rate" do
      SpendingRate.stub(:find).with("37") { mock_spending_rate }
      get :edit, :id => "37"
      assigns(:spending_rate).should be(mock_spending_rate)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created spending_rate as @spending_rate" do
        SpendingRate.stub(:new).with({'these' => 'params'}) { mock_spending_rate(:save => true) }
        post :create, :spending_rate => {'these' => 'params'}
        assigns(:spending_rate).should be(mock_spending_rate)
      end

      it "redirects to the created spending_rate" do
        SpendingRate.stub(:new) { mock_spending_rate(:save => true) }
        post :create, :spending_rate => {}
        response.should redirect_to(spending_rate_url(mock_spending_rate))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved spending_rate as @spending_rate" do
        SpendingRate.stub(:new).with({'these' => 'params'}) { mock_spending_rate(:save => false) }
        post :create, :spending_rate => {'these' => 'params'}
        assigns(:spending_rate).should be(mock_spending_rate)
      end

      it "re-renders the 'new' template" do
        SpendingRate.stub(:new) { mock_spending_rate(:save => false) }
        post :create, :spending_rate => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested spending_rate" do
        SpendingRate.should_receive(:find).with("37") { mock_spending_rate }
        mock_spending_rate.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :spending_rate => {'these' => 'params'}
      end

      it "assigns the requested spending_rate as @spending_rate" do
        SpendingRate.stub(:find) { mock_spending_rate(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:spending_rate).should be(mock_spending_rate)
      end

      it "redirects to the spending_rate" do
        SpendingRate.stub(:find) { mock_spending_rate(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(spending_rate_url(mock_spending_rate))
      end
    end

    describe "with invalid params" do
      it "assigns the spending_rate as @spending_rate" do
        SpendingRate.stub(:find) { mock_spending_rate(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:spending_rate).should be(mock_spending_rate)
      end

      it "re-renders the 'edit' template" do
        SpendingRate.stub(:find) { mock_spending_rate(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested spending_rate" do
      SpendingRate.should_receive(:find).with("37") { mock_spending_rate }
      mock_spending_rate.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the spending_rates list" do
      SpendingRate.stub(:find) { mock_spending_rate }
      delete :destroy, :id => "1"
      response.should redirect_to(spending_rates_url)
    end
  end

end
