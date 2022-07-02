Rails.application.routes.draw do
  root to: "homepage#index"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :posts
    end
  end



end
