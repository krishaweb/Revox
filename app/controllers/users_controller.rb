class UsersController < ApplicationController
  before_action :authenticate_user!, only:[:index, :my_profile]
  before_action :find_user, only:[:my_profile, :update_my_profile]
  
  def index
    
  end

  def my_profile
  end

  def update_my_profile
     if @users.update user_data
        redirect_to change_contact_path, notice: 'My Profile detail has been updated successfully.'
     else
        render action: :my_profile
     end
  end

  # def email_subscription
     
  # end

  # def update_email_subscription
  #    if @users.update user_data
  #       redirect_to email_subscription_path, notice: 'Email subscription has been updated successfully. '
  #    else
  #       render action: :email_subscription
  #    end
  # end

  private

  def user_data
    params.require(:user).permit!
  end
  def find_user
   @users = User.find_by(email: current_user.email)
  end

end