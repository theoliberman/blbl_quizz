Rails.application.routes.draw do
  get 'welcome/index'
  resources :players
  resources :questions

  root to: 'welcome#index'

  post 'questions/:id/check/:answer', to: 'questions#check', as: 'check'

  post 'players/:id', to: 'players#select'

  post 'logout', to: 'players#logout'

end
