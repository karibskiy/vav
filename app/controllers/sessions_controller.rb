include SessionsHelper
class SessionsController < ApplicationController

	def create

		user = User.find_by(email: params[:session][:email])
		if user && (user.password == params[:session][:password]) 
			sign_in user
			flash[:success] = "Signed In"
			redirect_to product_path
		else
			@title = "Sign In"
			flash.now[:danger] = "Username/password did not match"
			render 'new'

		end

	end

	def destroy
		sign_out
		flash[:success] = "Signed Out"
		redirect_to root_url
	end


	
end
