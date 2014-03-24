require 'spec_helper'

describe ProductsController do

	let(:product) { create(:product) }

  describe "GET '#index'" do
  	it "returns http success" do
      get 'index'
      response.should be_success
    end
    it "renders the index template" do
      get :index
      response.should render_template :index
    end
    it "populates and array of products" do
    	get :index
    	assigns(:products).should eq([product])
    end
  end

	describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
    it "should render the new template" do
    	get :new
    	response.should render_template :new
    end
    it "creates a new product item" do
      get :new
      assigns(:product).should be_kind_of(Product)
    end
    it "builds a finish item" do
    	product.finishes.build
    	get :new
    	product.finishes.should be_present
    end
    it "builds a size item" do
    	product.sizes.build
    	get :new
    	product.sizes.should be_present
    end
    it "builds a quantity item" do
    	product.quantities.build
    	get :new
    	product.quantities.should be_present
    end
  end

  describe "POST '#create'" do
	  context "with valid attributes" do
      it "saves the product to the database" do
        expect{ post :create, product: attributes_for(:product)
          }.to change(Product,:count).by(1)
      end

      it "assigns a newly created product as @product" do
        post :create, product: attributes_for(:product)
        assigns(:product).should be_a(Product)
        assigns(:product).should be_persisted
      end

      it "redirects to the products index" do
        post :create, product: attributes_for(:product)
        response.should redirect_to(products_path)
      end
    end

    context "with invalid attributes" do
      it "does not save the new product in the database" do
        expect{ post :create, product: attributes_for(:product, custom: 'a') 
        }.to_not change(Product,:count)
      end
    
      it "re-renders the :new template" do
        post :create, product: attributes_for(:product, custom: 'a') 
        response.should render_template :new
      end
    end
  end

  describe "GET '#edit'" do
  	 it "returns http success" do
      get 'edit', id: product
      response.should be_success
    end
    it "should render the edit template" do
    	get :edit, id: product
    	response.should render_template :edit
    end
    it "finds the product to edit" do
      get :edit, id: product
      assigns(:product).should be_kind_of(Product)
    end
  end

  describe "PATCH '#update'" do
		it "locates the correct product" do
      put :update, id: product, product: attributes_for(:product) 
      assigns(:product).should eq(product)
    end

    context "with valid attributes" do
      it "changes product attributes" do
        put :update, id: product, product: attributes_for(:product, name: "new name") 
        product.reload 
        product.name.should eq("new name") 
      end

      it "redirects to the products#index" do
        patch :update, id: product, product: attributes_for(:product)
        response.should redirect_to products_url
      end
    end

    context "invalid attributes" do 
      it "does not change product attributes" do 
        patch :update, id: product, product: attributes_for(:product, name: nil) 
        product.reload 
        product.name.should_not eq(nil) 
      end 
      it "re-renders the edit method" do 
        patch :update, id: product, product: attributes_for(:invalid_product) 
        response.should render_template :edit 
      end 
    end
  end

  describe "DELETE '#destroy'" do
		it "locates the correct product" do
      put :update, id: product, product: attributes_for(:product) 
      assigns(:product).should eq(product)
    end
        
    it "deletes the product" do 
      product
      expect{ delete :destroy, id: product 
        }.to change(Product,:count).by(-1) 
    end
		it "redirects to products#index" do 
      delete :destroy, id: product 
      response.should redirect_to products_url 
    end  
  end
end
