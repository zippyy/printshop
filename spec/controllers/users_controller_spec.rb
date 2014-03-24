require 'spec_helper'

describe UsersController do
	
	let(:user) { create(:user) }

	describe "GET #index" do
		it "returns http success" do
      get 'index'
      response.should be_success
    end
		it "populates an array of users" do
			get :index 
			assigns(:users).should eq([user])
		end

		it "renders the :index view" do
			get :index
			response.should render_template :index
		end 
	end

	describe "POST #create" do
		context "with valid attributes" do
			it "creates a new user" do
				expect{ post :create, user: attributes_for(:user, email: "pat2@gmail.com")
					}.to change(User,:count).by(1)
				expect(flash[:notice]).to eq "Signed up!"

			end

			it "redirects to the homepage" do
				post :create, user: attributes_for(:user, email: "pat2@gmail.com")
				response.should redirect_to dashboard_url
        expect(flash[:notice]).to eq "Signed up!"

			end

		end

		context "with invalid attributes" do
			it "does not save the new user in the database" do
				expect{ post :create, user: attributes_for(:user, email: nil) 
					}.to_not change(User,:count)
			end
			
			it "re-renders the :new template" do
				post :create, user: attributes_for(:user, email: nil) 
				response.should render_template :new
			end
		end
	end

	describe "GET '#edit'" do
		it "returns http success" do
      get 'edit', id: user
      response.should be_success
    end
    it "should render the edit template" do
    	get :edit, id: user
    	response.should render_template :edit
    end
    it "finds the user to edit" do
      get :edit, id: user
      assigns(:user).should be_kind_of(User)
    end

	end


	describe "PATCH #update" do
		context "with valid attributes" do
			it "locates the correct user" do
				put :update, id: user, user: attributes_for(:user) 
				assigns(:user).should eq(user)
			end

			it "changes users attributes" do
				put :update, id: user, user: attributes_for(:user, email: "asdd@gmail.com") 
				user.reload 
				user.email.should eq("asdd@gmail.com") 
			end

			it "redirects to the updated user page" do
				patch :update, id: user, user: attributes_for(:user)
				response.should redirect_to users_url
			end
		end

		context "invalid attributes" do 
			it "locates the requested user" do 
				patch :update, id: user, user: attributes_for(:user) 
				assigns(:user).should eq(user) 
			end 

			it "does not change users attributes" do 
				patch :update, id: user, user: attributes_for(:user, email: nil) 
				user.reload 
				user.email.should_not eq(nil) 
				user.email.should eq(user.email)
			end 

			it "re-renders the edit method" do 
				patch :update, id: user, user: attributes_for(:invalid_user) 
				response.should render_template :edit
			end 
		end
	end

	describe 'DELETE destroy' do 
				
		it "deletes the user" do 
			user
			expect{ delete :destroy, id: user 
				}.to change(User,:count).by(-1) 
		end 

		it "redirects to contacts#index" do 
			delete :destroy, id: user 
			response.should redirect_to users_url 
		end 
	end 		
end