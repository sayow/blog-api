# frozen_string_literal: true

Rails.application.routes.draw do
  get    "posts",          to: "posts#index"
  get    "posts/new",      to: "posts#new",  as: :new_post
  post   "posts",          to: "posts#create"
  get    "posts/:id",      to: "posts#show", as: :post
  get    "posts/:id/edit", to: "posts#edit", as: :edit_post
  patch  "posts/:id",      to: "posts#update"
  delete "posts/:id",      to: "posts#destroy"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :posts
    end
  end
end
