Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :test, only: %i[index]

      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations',
        omniauth_callbacks: 'api/v1/auth/omniauth_callbacks'
      }

      namespace :auth do
        resources :sessions, onlt: %i[index]
      end
    end
  end
end
