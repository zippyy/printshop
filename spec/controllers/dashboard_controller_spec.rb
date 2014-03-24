require 'spec_helper'

describe DashboardController do

	let(:product) { create(:product) }

	describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end

  end
end
