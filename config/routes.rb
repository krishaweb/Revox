Rails.application.routes.draw do
  devise_for :users, 
    path: "member", 
    controllers: { sessions: "sessions" },
    path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', 
      confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: '' }
  root 'welcome#index'
  
end
