require 'spec_helper'

describe SessionsController do

  describe "POST #create" do

		before :each do
      @user = create(:user)
    end
    
    context "with valid credentials" do
      it "logs a user in" do
        post :create, { 
          email: "pat@gmail.com",
          password: "secret"
        }
        expect(response).to be_redirect
        expect(response).to redirect_to dashboard_path
        expect(flash[:notice]).to eq "Logged in!"
      end
    end

    context "with invalid credentials" do
      it "doesn't log a user in when a user doesn't exist" do
        post :create, {
          email: "someguy@gmail.com",
          password: "somepass",
        }
        expect(response).to render_template :new
        expect(flash[:alert]).to eq "Email or password was invalid"
      end

      it "doesn't log a user in when a password is incorrect." do
        post :create, {
          email: "pat@gmail.com",
          password: "asdf",
        }
        expect(response).to render_template :new
        expect(flash[:alert]).to eq "Email or password was invalid"
      end

      it "doesn't log a user in when the email is incorrect." do
        post :create, {
          email: "path@gmail.com",
          password: "secret",
        }
        expect(response).to render_template :new
        expect(flash[:alert]).to eq "Email or password was invalid"
      end
	  end

	  describe "POST #destroy" do
	    
	    it "logs a user out" do
	      delete :destroy
	      expect(response).to be_redirect
	      expect(response).to redirect_to root_path
	      expect(flash[:notice]).to eq "Logged out!"
	    end
	  end
  end
end
