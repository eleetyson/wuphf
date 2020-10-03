class UsersController < ApplicationController
  before_action :require_login, only: [:show]
  before_action :require_logout, only: [:home, :new, :create]

# root for login / signup
  def home
  end

# GET /users
# renders the sign up form
  def new
    @user = User.new
  end

# POST /users
# creates an account for the user and logs them in if given valid info
# redirects to sign up page with flash message if not
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
# renders the dashboard for existing users
  def show
    @user = User.find_by(id: params[:id])

    if @user.id == current_user.id
      @message = @user.messages.build
      @friends = current_user.friends.distinct
      render layout: "dashboard"
    else
      redirect_to user_path(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
