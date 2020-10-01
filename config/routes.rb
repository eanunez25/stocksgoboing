Rails.application.routes.draw do
  devise_for :users
  resources :static_pages
  resources :bull_put_spreads
  resources :short_puts
  resources :bear_call_spreads
  resources :short_calls
  resources :equities

  root 'static_pages#home'

  get '/trades', to: 'static_pages#show_trades'
  get 'bps', to: 'bull_put_spreads#index'
  get '/covid19', to: 'static_pages#covid'
  get '/rut', to: 'static_pages#rut'

  devise_scope :user do
    # register
    get 'signup', to: 'devise/registrations#new'
    # sessions
    get 'login', to: 'devise/sessions#new'
    delete 'logout', to: 'devise/sessions#destroy'
  end

end
