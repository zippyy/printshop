require 'spec_helper'

describe DashboardController do

	let(:product) { create(:product) }

	describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end

    it "populates an array of products" do
      get :index 
      assigns(:products).should eq([product])
    end
  end
end
