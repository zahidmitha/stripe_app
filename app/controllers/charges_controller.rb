class ChargesController < ApplicationController

	def new
	end

	def create
	  # Amount in cents
	  @amount = 99999999

	  customer = Stripe::Customer.create(
	    :email => 'zahid@sendmethedolla.com',
	    :card  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Silk Road Payment',
	    :currency    => 'usd'
	  )

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_path
	end

end
