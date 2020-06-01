Rails.application.routes.draw do
  resources :questions
  post "questions/:id/check/:awnser", to: "questions#check"
end
