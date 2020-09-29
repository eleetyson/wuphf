class UsersController < ApplicationController
# root
  def home
  end

# GET /users
# renders the sign up form
  def new
    @user = User.new
  end

# POST /users
# create an account for the user and log them in if given valid info
# redirect to sign up page with error message if not
  def create
    @user = User.create(user_params)

    if @user.save
      session[:user_id] = @user.id
      # redirect_to dashboard
    else
      flash[:message] = "invalid information"
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
