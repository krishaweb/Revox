class UsersController < ApplicationController
  before_action :authenticate_user!, only:[:index, :change_email]
  before_action :find_user, only:[:change_email, :change_email_address]
  
  def index
    
  end

  def change_email
     
  end

  def change_email_address
     @users.email  = params[:user][:new_email]
     if @users.update! user_data
        redirect_to change_email_path, notice: 'Email has been updated successfully. '
     else
        render action: :change_email
     end
     
  end

  # def contact_detail
  # end

  # def update_contact
  #    if @users.update user_data
  #       redirect_to change_contact_path, notice: 'Contact detail has been updated successfully.'
  #    else
  #       render action: :contact_detail
  #    end
  # end

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