Rails.application.routes.draw do

  namespace :api, path: '/', constraints: { subdomain: 'api' } do
    namespace :v1 do
      resources :dreams, :users, except: [:new, :edit]
    end
  end

  # namespace :api do
  #   namespace :v1 do
  #     resources :dreams, :users, except: [:new, :edit]
  #   end
  # end

end
