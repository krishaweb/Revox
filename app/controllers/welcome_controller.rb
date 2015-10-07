class WelcomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @total_user = User.count 
  end

  def email

  end

  def social

  end

  def calendar

  end

end