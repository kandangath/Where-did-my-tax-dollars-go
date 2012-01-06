require 'spec_helper'

describe SpendingCategoriesController do

  def mock_spending_category(stubs={})
    (@mock_spending_category ||= mock_model(SpendingCategory).as_null_object).tap do |spending_category|
      spending_category.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all spending_categories as @spending_categories" do
      SpendingCategory.stub(:all) { [mock_spending_category] }
      get :index
      assigns(:spending_categories).should eq([mock_spending_category])
    end
  end

  describe "GET show" do
    it "assigns the requested spending_category as @spending_category" do
      SpendingCategory.stub(:find).with("37") { mock_spending_category }
      get :show, :id => "37"
      assigns(:spending_category).should be(mock_spending_category)
    end
  end

  describe "GET new" do
    it "assigns a new spending_category as @spending_category" do
      SpendingCategory.stub(:new) { mock_spending_category }
      get :new
      assigns(:spending_category).should be(mock_spending_category)
    end
  end

  describe "GET edit" do
    it "assigns the requested spending_category as @spending_category" do
      SpendingCategory.stub(:find).with("37") { mock_spending_category }
      get :edit, :id => "37"
      assigns(:spending_category).should be(mock_spending_category)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created spending_category as @spending_category" do
        SpendingCategory.stub(:new).with({'these' => 'params'}) { mock_spending_category(:save => true) }
        post :create, :spending_category => {'these' => 'params'}
        assigns(:spending_category).should be(mock_spending_category)
      end

      it "redirects to the created spending_category" do
        SpendingCategory.stub(:new) { mock_spending_category(:save => true) }
        post :create, :spending_category => {}
        response.should redirect_to(spending_category_url(mock_spending_category))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved spending_category as @spending_category" do
        SpendingCategory.stub(:new).with({'these' => 'params'}) { mock_spending_category(:save => false) }
        post :create, :spending_category => {'these' => 'params'}
        assigns(:spending_category).should be(mock_spending_category)
      end

      it "re-renders the 'new' template" do
        SpendingCategory.stub(:new) { mock_spending_category(:save => false) }
        post :create, :spending_category => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested spending_category" do
        SpendingCategory.should_receive(:find).with("37") { mock_spending_category }
        mock_spending_category.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :spending_category => {'these' => 'params'}
      end

      it "assigns the requested spending_category as @spending_category" do
        SpendingCategory.stub(:find) { mock_spending_category(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:spending_category).should be(mock_spending_category)
      end

      it "redirects to the spending_category" do
        SpendingCategory.stub(:find) { mock_spending_category(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(spending_category_url(mock_spending_category))
      end
    end

    describe "with invalid params" do
      it "assigns the spending_category as @spending_category" do
        SpendingCategory.stub(:find) { mock_spending_category(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:spending_category).should be(mock_spending_category)
      end

      it "re-renders the 'edit' template" do
        SpendingCategory.stub(:find) { mock_spending_category(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested spending_category" do
      SpendingCategory.should_receive(:find).with("37") { mock_spending_category }
      mock_spending_category.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the spending_categories list" do
      SpendingCategory.stub(:find) { mock_spending_category }
      delete :destroy, :id => "1"
      response.should redirect_to(spending_categories_url)
    end
  end

end
