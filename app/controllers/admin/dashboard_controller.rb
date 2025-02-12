class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def index
    @books = Book.all
  end

  def profile
    @user = current_user
  end

  def update_profile
    @user = current_user
    if @user.update(user_params)
      bypass_sign_in(@user)  # Keeps admin signed in after updating credentials
      redirect_to admin_profile_path, notice: "Profile updated successfully!"
    else
      render :profile, status: :unprocessable_entity
    end
  end

  private

  def check_admin
    redirect_to root_path, alert: "Access denied." unless current_user.admin?
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
