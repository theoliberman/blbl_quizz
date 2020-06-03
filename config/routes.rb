Rails.application.routes.draw do
  get 'welcome/index'
  resources :players
  resources :questions, except: [:show]

  root to: 'welcome#index'

  get 'questions/:rank', to: 'questions#show'
  post 'questions/:id/check/(:answer)', to: 'questions#check', as: 'check'

  post 'players/:id', to: 'players#select'

  post 'logout', to: 'players#logout'

  post 'authenticate', to: 'players#authenticate'

  get 'rank', to: 'welcome#rank'
  post 'next', to: 'welcome#next'
  post 'reset', to: 'welcome#reset'
end
