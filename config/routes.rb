Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :dreams, :users
    end
  end

end
