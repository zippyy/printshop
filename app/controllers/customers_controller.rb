class CustomersController < ApplicationController
  def index

  end

  def new
  	@customer = Customer.new
  end

  def create
		@customer = Customer.new(customer_params)
	  if @customer.save
	    redirect_to dashboard_url, :notice => "Signed up!"
	  else
	    render :new
	  end
  end

  private

  def customer_params
  	params.require(:customer).permit(:name, :company, :email, :email_confirmation)  	
  end
end
