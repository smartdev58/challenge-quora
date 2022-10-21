Rails.application.routes.draw do
  resources :answers
  resources :questions
  devise_for :users,
             path: '',
             path_names: {
               sign_up: 'api/v1/register',
               sign_in: 'api/v1/login',
               sign_out: 'api/v1/logout',
               registration: 'api/v1/users'
             },
             controllers: {
               sessions: 'api/v1/users/sessions',
               registrations: 'api/v1/users/registrations'
             }
end
