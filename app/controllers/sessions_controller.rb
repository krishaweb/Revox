class SessionsController < Devise::SessionsController
layout 'login', only: [:new, :create]
private

end