class UsersController < ApplicationController
  before_action :authenticate_user!, only:[:index, :my_profile]
  before_action :find_user, only:[:my_profile, :update_my_profile, :edit, :update, :destroy]
  
  def index
    if params[:q].blank?
      @row = User.all
    else
      @row = User.where("fname ILIKE ? or lname ILIKE? or email ILIKE?", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%")
    end
  end

  def new
    @users = User.new
  end

  def create
    @users = User.new user_data
    if @users.save
      if remotipart_submitted? 
        head :created
      else
        head :created
      end
    else
      render json: @users.errors, status: :unprocessable_entity
    end
  end

  # def add_user
  #   @users = User.new user_data
  #   if @users.save
  #     if remotipart_submitted? 
  #       head :created
  #     end
  #   else
  #     render json: @users.errors, status: :unprocessable_entity
  #   end
  # end
  
  def edit
  end

  def update
    if @users.update user_data
      if remotipart_submitted? 
        head :created
      else
        head :created
      end
    else
      render json: @users.errors, status: :unprocessable_entity
    end
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

  def destroy
  begin
    @users.destroy
    redirect_to users_path, notice: 'User has been deleted successfully.'
    rescue Exception => e
      redirect_to users_path, alert: 'User could not been deleted.'
  end
 end

  private

  def user_data
    if params[:action] == "update" and params[:user] and params[:user][:password].blank?
      params.require(:user).permit.not(:password)
    else
      params.require(:user).permit!
    end
  end
  def find_user
   @users = User.find params[:id]
  end
end