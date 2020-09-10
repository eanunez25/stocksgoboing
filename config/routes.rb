Rails.application.routes.draw do
  devise_for :users
  resources :static_pages

  root 'static_pages#home'
end
