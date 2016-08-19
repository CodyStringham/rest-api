Rails.application.routes.draw do



  namespace :api, path: '/', constraints: { subdomain: 'api' } do
    namespace :v1 do
      resources :dreams, :users, except: [:new, :edit]
    end
    namespace :v2 do
      get "/fast", to: 'fake#fast', as: :fast
      get "/normal", to: 'fake#normal', as: :normal
      get "/slow", to: 'fake#slow', as: :slow
    end
  end

  # namespace path_helper hackery!
  get '/v1/dreams/:id', to: 'dreams#show', as: :dream
  get '/v1/users/:id', to: 'users#show', as: :user

end
