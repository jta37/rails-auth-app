class UsersController < ApplicationController
	before_action :logged_in?, only: [:show]

  def index
  end

  def show
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.create(user_params)
  	redirect_to user_path(@user.id)
  end

  def edit
  end

  private
  	# This user_params method is being used above in the create method
  	def user_params
  		params.require(:user).permit(:email, :password, :password_confirmation)
  	end

end
