require 'spec_helper'

describe FilingCategoriesController do

  def mock_filing_category(stubs={})
    (@mock_filing_category ||= mock_model(FilingCategory).as_null_object).tap do |filing_category|
      filing_category.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all filing_categories as @filing_categories" do
      FilingCategory.stub(:all) { [mock_filing_category] }
      get :index
      assigns(:filing_categories).should eq([mock_filing_category])
    end
  end

  describe "GET show" do
    it "assigns the requested filing_category as @filing_category" do
      FilingCategory.stub(:find).with("37") { mock_filing_category }
      get :show, :id => "37"
      assigns(:filing_category).should be(mock_filing_category)
    end
  end

  describe "GET new" do
    it "assigns a new filing_category as @filing_category" do
      FilingCategory.stub(:new) { mock_filing_category }
      get :new
      assigns(:filing_category).should be(mock_filing_category)
    end
  end

  describe "GET edit" do
    it "assigns the requested filing_category as @filing_category" do
      FilingCategory.stub(:find).with("37") { mock_filing_category }
      get :edit, :id => "37"
      assigns(:filing_category).should be(mock_filing_category)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created filing_category as @filing_category" do
        FilingCategory.stub(:new).with({'these' => 'params'}) { mock_filing_category(:save => true) }
        post :create, :filing_category => {'these' => 'params'}
        assigns(:filing_category).should be(mock_filing_category)
      end

      it "redirects to the created filing_category" do
        FilingCategory.stub(:new) { mock_filing_category(:save => true) }
        post :create, :filing_category => {}
        response.should redirect_to(filing_category_url(mock_filing_category))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved filing_category as @filing_category" do
        FilingCategory.stub(:new).with({'these' => 'params'}) { mock_filing_category(:save => false) }
        post :create, :filing_category => {'these' => 'params'}
        assigns(:filing_category).should be(mock_filing_category)
      end

      it "re-renders the 'new' template" do
        FilingCategory.stub(:new) { mock_filing_category(:save => false) }
        post :create, :filing_category => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested filing_category" do
        FilingCategory.should_receive(:find).with("37") { mock_filing_category }
        mock_filing_category.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :filing_category => {'these' => 'params'}
      end

      it "assigns the requested filing_category as @filing_category" do
        FilingCategory.stub(:find) { mock_filing_category(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:filing_category).should be(mock_filing_category)
      end

      it "redirects to the filing_category" do
        FilingCategory.stub(:find) { mock_filing_category(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(filing_category_url(mock_filing_category))
      end
    end

    describe "with invalid params" do
      it "assigns the filing_category as @filing_category" do
        FilingCategory.stub(:find) { mock_filing_category(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:filing_category).should be(mock_filing_category)
      end

      it "re-renders the 'edit' template" do
        FilingCategory.stub(:find) { mock_filing_category(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested filing_category" do
      FilingCategory.should_receive(:find).with("37") { mock_filing_category }
      mock_filing_category.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the filing_categories list" do
      FilingCategory.stub(:find) { mock_filing_category }
      delete :destroy, :id => "1"
      response.should redirect_to(filing_categories_url)
    end
  end

end
