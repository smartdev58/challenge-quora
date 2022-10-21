Rails.application.routes.draw do
  resources :answers
  resources :questions
  devise_for :users,
             controllers: {
               sessions: 'api/v1/users/sessions',
               registrations: 'api/v1/users/registrations'
             }
end
