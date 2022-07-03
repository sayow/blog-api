# frozen_string_literal: true

Rails.application.routes.draw do
  get 'homepage' => 'homepages#home'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :posts
    end
  end
end
