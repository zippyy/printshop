require 'spec_helper'

describe WelcomeController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end

    it 
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
