require 'spec_helper'

describe PromoItemsController do

  let(:promo_item) {create(:promo_item)}
  let(:product) {create(:product)}

  describe "GET '#index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end 

    it "populates an array of promo_items" do
      get :index 
      assigns(:promo_items).should eq([promo_item])
    end
  end

  describe "GET '#new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end

    it "renders the :new view" do
      get :new
      response.should render_template :new
    end 
    it "maps an array of product name and id arrays" do
      get :new
      assigns(:products).should_not be_nil
    end

    it "creates a new promo item" do
      get :new
      assigns(:promo_item).should be_kind_of(PromoItem)
    end
  end

  describe "POST '#create'" do
    context "with valid atributes" do
      it "saves the promo item to the database" do
        expect{ post :create, promo_item: attributes_for(:promo_item)
          }.to change(PromoItem,:count).by(1)
      end

      it "assigns a newly created promo item as @promo_item" do
        post :create, promo_item: attributes_for(:promo_item)
        assigns(:promo_item).should be_a(PromoItem)
        assigns(:promo_item).should be_persisted
      end

      it "redirects to the promo items index" do
        post :create, promo_item: attributes_for(:promo_item)
        response.should redirect_to(promo_items_path)
      end
    end

    context "with invalid attributes" do
      it "does not save the new promo item in the database" do
        expect{ post :create, promo_item: attributes_for(:promo_item, product_id: 'a') 
        }.to_not change(PromoItem,:count)
      end
    
      it "re-renders the :new template" do
        post :create, promo_item: attributes_for(:promo_item, product_id: 'a') 
        response.should render_template :new
      end
    end
  end

  describe "GET '#edit'" do
    it "returns http success" do
      get 'edit', id: promo_item
      response.should be_success
    end

    it "renders the :edit view" do
      get :edit, id: promo_item
      response.should render_template :edit
    end 
    it "assigns the promo item to @promo_item" do
      get :edit, id: promo_item
      assigns(:promo_item).should eq(promo_item)
    end
    it "maps an array of product name and id arrays" do
      get :edit, id: promo_item
      assigns(:products).should_not be_nil
    end
  end

  describe "PATCH '#update'" do
    it "locates the correct promo item" do
      put :update, id: promo_item, promo_item: attributes_for(:promo_item) 
      assigns(:promo_item).should eq(promo_item)
    end

    context "with valid attributes" do
      it "changes promo_item attributes" do
        put :update, id: promo_item, promo_item: attributes_for(:promo_item, description: "new description") 
        promo_item.reload 
        promo_item.description.should eq("new description") 
      end

      it "redirects to the updated promo_item page" do
        patch :update, id: promo_item, promo_item: attributes_for(:promo_item)
        response.should redirect_to promo_items_url
      end
    end

    context "invalid attributes" do 

      it "does not change promo_item attributes" do 
        patch :update, id: promo_item, promo_item: attributes_for(:promo_item, product_id: 'a', description: nil) 
        promo_item.reload 
        promo_item.product_id.should_not eq('a') 
        promo_item.description.should_not eq(nil) 
      end 

      it "re-renders the edit method" do 
        patch :update, id: promo_item, promo_item: attributes_for(:invalid_promo_item) 
        response.should render_template :edit 
      end 
    end
  end

  describe "DELETE '#destroy'" do 
    it "locates the correct promo item" do
      put :update, id: promo_item, promo_item: attributes_for(:promo_item) 
      assigns(:promo_item).should eq(promo_item)
    end
        
    it "deletes the promo_item" do 
      promo_item
      expect{ delete :destroy, id: promo_item 
        }.to change(PromoItem,:count).by(-1) 
    end 

    it "redirects to artciles#index" do 
      delete :destroy, id: promo_item 
      response.should redirect_to promo_items_url 
    end 
  end      

end
