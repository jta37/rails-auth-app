class SessionsController < ApplicationController
  def new
  end

  def create
  	user_params = params.require(:user)
  	user = User.confirm(user_params[:email],user_params[:password])
  	if user
  		# use our handy login method
  		self.login(user)
  		redirect_to user_path(user.id)
  	else
  		# flash an Error message
  		flash[:error] = "Failed to authenticate string, please try again."
  		redirect_to "/login"
  	end

  end
end
