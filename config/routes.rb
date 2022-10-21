Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :answers
      resources :questions

      devise_for :users,
                 path: '',
                 path_names: {
                   sign_up: 'register',
                   sign_in: 'login',
                   sign_out: 'logout',
                   registration: 'api/v1/users'
                 },
                 controllers: {
                   sessions: 'users/sessions',
                   registrations: 'users/registrations'
                 }
    end
  end
end
