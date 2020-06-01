Rails.application.routes.draw do
  resources :questions

  post 'questions/:id/check/:answer', to: 'questions#check'
end
