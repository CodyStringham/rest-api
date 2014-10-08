Rails.application.routes.draw do

  #resources :dreams, :users

  namespace :api do
    resources :dreams, :users
  end


end
