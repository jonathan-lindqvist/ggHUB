# frozen_string_literal: true

# Validates, CRUD for users
class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[index edit update destroy show
                                          following followers]
  before_action :correct_user,   only: %i[edit update]
  before_action :admin_user,     only: %i[destroy roleupdate]

  def index
    @users = User.where(activated: true).paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
    # rubocop:disable Style/AndOr
    redirect_to users_url and return unless @user.activated
    # rubocop:enable Style/AndOr
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = 'Please check your email to activate your account.'
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit; end

  def update
    # rubocop:disable Rails/ActiveRecordAliases
    if @user.update_attributes(user_params)
      flash[:success] = 'Profile updated'
      redirect_to @user
    else
      render 'edit'
    end
    # rubocop:enable Rails/ActiveRecordAliases
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'User deleted'
    redirect_to users_url
  end

  def following
    @title = 'Following'
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = 'Followers'
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  def roleupdate
    user = User.find(params[:id])
    # rubocop:disable Rails/ActiveRecordAliases
    if user.update_attributes(user_params)
      flash[:success] = 'Profile updated'
      redirect_to user
    end
    # rubocop:enable Rails/ActiveRecordAliases
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :role,
                                 :password_confirmation)
  end

  # Before filters

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  # Confirms an admin user.
  def admin_user
    redirect_to(root_url) unless current_user.role == 'Admin'
  end
end
