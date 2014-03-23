require 'spec_helper'

describe WelcomeController do

  let (:promo_item) { create(:promo_item) }
  
  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end

    it "populates an array of promo_items" do
      get :index 
      assigns(:promo_items).should eq([promo_item])
    end
  end

  describe "GET 'services'" do
  	it "returns http success" do
  		get 'services'
  		response.should be_success
  	end
  end

  describe "GET 'about'" do
  	it "returns http success" do
  		get 'about'
  		response.should be_success
  	end
  end
end
