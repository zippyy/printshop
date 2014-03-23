require 'spec_helper'

describe PricesController do

	let(:price) {create(:price)}
	let(:product) {create(:product)}

  describe "GET '#index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
    it "renders the index template" do
      get :index
      response.should render_template :index
    end
    it "assigns all products to products array" do
    	get :index
    	assigns(:products).should eq([product])
    end

    it "assigns a a new price item" do
      get :index
      assigns(:price).should be_kind_of(Price)
    end
  end

  describe "GET '#edit'" do
  	it "returns js succes" do
      get :edit, id: price, format: :js
      response.should be_success
    end
   
    it "renders the :edit view" do
      get :edit, id: price, format: :js
      response.should render_template :edit
    end 
		it "should render js" do
		  xhr :get, 'edit', id: price
		  response.content_type.should == Mime::JS
		end    

    it "assigns the price to @price" do
	    pending("assign price properly")
    end
  end
  
  describe "POST '#create'" do
  	
		context "with valid atributes" do
      it "saves the price item to the database" do
      	pending
        # expect{ post :create, price: attributes_for(:price)
        #   }.to change(Price,:count).by(1)
      end

      it "assigns a newly created price item as @price" do
      	pending
        # post :create, price: attributes_for(:price), format: :js
        # assigns(:price).should be_a(Price)
        # assigns(:price).should be_persisted
      end

      it "redirects to the price index" do
      	pending
        # post :create, price: attributes_for(:price), format: :js
        # response.should redirect_to(prices_path)
      end
    end

    context "with invalid attributes" do
      it "does not save the new promo item in the database" do
      	pending
        # expect{ post :create, price: attributes_for(:price, product_id: 'a') 
        # }.to_not change(Price,:count)
      end
    
      it "re-renders the :new template" do
      	pending
        # post :create, price: attributes_for(:price, product_id: 'a') 
        # response.should render_template :new
      end
    end


  end

  describe "PATCH '#update'" do
		pending  	
  end
end
