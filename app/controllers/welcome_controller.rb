class WelcomeController < ApplicationController

  def index
      render text: 'Hi! I m nirav.'
  end

  def aboutus
    @content = Content.find_by_code('about_us')
  end

  def subscribe
    # @subscriber = Subscriber.new params.require(:subscribe).permit(:email)
    # @subscriber.ip = request.remote_ip
    # @subscriber.ua = request.user_agent

    # if @subscriber.save
    #   head :created
    # else
    #   render json: @subscriber.errors.full_messages, status: :unprocessable_entity
    # end
  end

end