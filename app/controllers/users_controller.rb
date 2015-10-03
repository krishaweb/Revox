class UsersController < ApplicationController
  before_action :authenticate_user!, only:[:index, :my_profile]
  before_action :find_user, only:[:my_profile, :update_my_profile, :edit, :update, :destroy]
  
  def index
    @row = User.all
  end

  def new
    @users = User.new
  end

  def create
    @users = User.new user_data
    if @users.save
      redirect_to users_path, notice: 'User has been saved successfully.'
    else
      render action: :new
    end
  end

  def add_user
    @users = User.new user_data
    if @users.save
      head :created
    else
      render json: @users.errors, status: :unprocessable_entity
    end
  end
  
  def edit
  end

  def update
    if @users.update user_data
      redirect_to users_path, notice: 'User has been updated successfully. '
    else
      render action: :edit
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
    params.require(:user).permit!
  end
  def find_user
   @users = User.find params[:id]
  end
end