# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'posts#home'
  get '/show/:id', to: 'posts#show'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :posts
    end
  end
end
