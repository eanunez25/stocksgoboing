Rails.application.routes.draw do
  devise_for :users
  resources :static_pages
  resources :bull_put_spreads

  root 'static_pages#home'

  get '/trades', to: 'static_pages#show_trades'
  get 'bps', to: 'bull_put_spreads#index'

  devise_scope :user do
    # register
    get 'signup', to: 'devise/registrations#new'
    # sessions
    get 'login', to: 'devise/sessions#new'
    delete 'logout', to: 'devise/sessions#destroy'
  end

end
