Rails.application.routes.draw do
  resources :players
  resources :questions

  post 'questions/:id/check/:answer', to: 'questions#check'

  post 'players/:id', to: 'players#select'

end
