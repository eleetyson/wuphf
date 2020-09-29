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
# redirect to sign up page with flash message if not
  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    elsif @user.errors.full_messages.present?
      flash[:message] = @user.errors.full_messages.first
      redirect_to new_user_path
    else
      flash[:message] = "invalid information"
      redirect_to new_user_path
    end
  end

# GET /users/:id
# renders the dashboard (views/users/show)
  def show
    @user = User.find_by(id: params[:id])
    render layout: "dashboard"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
