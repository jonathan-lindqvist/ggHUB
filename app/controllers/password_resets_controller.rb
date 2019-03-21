# frozen_string_literal: true

# Used to valited the user when reseting the password for the user
class PasswordResetsController < ApplicationController
  before_action :get_user,   only: %i[edit update]
  before_action :valid_user, only: %i[edit update]
  before_action :check_expiration, only: %i[edit update]

  def new; end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = 'Email sent with password reset instructions'
      redirect_to root_url
    else
      flash.now[:danger] = 'Email address not found'
      render 'new'
    end
  end

  def edit; end

  # rubocop:disable Rails/ActiveRecordAliases
  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, "can't be empty")
      render 'edit'
    elsif @user.update_attributes(user_params)
      log_in @user
      @user.update(reset_digest: nil)
      flash[:success] = 'Password has been reset.'
      redirect_to @user
    else
      render 'edit'
    end
  end
  # rubocop:enable Rails/ActiveRecordAliases

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  # rubocop:disable Naming/AccessorMethodName
  def get_user
    @user = User.find_by(email: params[:email])
  end
  # rubocop:enable Naming/AccessorMethodName

  # Confirms a valid user.
  def valid_user
    redirect_to root_url unless @user&.activated? && @user&.authenticated?(:reset, params[:id])
  end

  # Checks expiration of reset token.
  def check_expiration
    if @user.password_reset_expired?
      flash[:danger] = 'Password reset has expired.'
      redirect_to new_password_reset_url
    end
  end
end
