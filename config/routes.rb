Rails.application.routes.draw do
  devise_for :users, 
    path: "member", 
    controllers: { sessions: "sessions" },
    path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', 
      confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: '' }
  root 'welcome#index'
  get 'email' => 'welcome#email'
  get 'social' => 'welcome#social'
  get 'calendar' => 'welcome#calendar'
  resources :users
  post 'user' => 'users#add_user', as: :add_user
  # get 'my-profile' => 'users#my_profile', as: :my_profile
  # put 'my-profile' => 'users#update_my_profile'
  
end
