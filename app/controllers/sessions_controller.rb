class SessionsController < ApplicationController

	def new

	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			flash[:success] = "you have succesfully log in"
			redirect_to user_path(user)

		else
			flash.now[:danger] = "there was somthing wrong with your log in information"
			render 'new'


		end

	end


	def destroy
		session[:user_id]= nil
		flash[:success] = "You have successfully log out"
		redirect_to root_path


	end
	

end