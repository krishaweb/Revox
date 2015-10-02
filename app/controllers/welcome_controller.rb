class WelcomeController < ApplicationController
  before_action :authenticate_user!, only:[:index]	
  def index
     
  end

  def email

  end

  def social

  end

  def calendar

  end

end