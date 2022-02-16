Rails.application.routes.draw do
  mount_devise_token_auth_for "Employee", at: "auth"

  namespace :admin do
    get "home" => "home#index"
    resources :configurations, only: %i[show update]
  end

  namespace :front do
  end
end
