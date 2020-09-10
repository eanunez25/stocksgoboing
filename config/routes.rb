Rails.application.routes.draw do
  devise_for :users
  resources :static_pages

  root 'static_pages#home'

  devise_scope :user do
    # register
    get 'signup', to: 'devise/registrations#new'
    # sessions
    get 'login', to: 'devise/sessions#new'
    delete 'logout', to: 'devise/sessions#destroy'
  end

end
