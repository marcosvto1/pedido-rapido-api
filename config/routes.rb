Rails.application.routes.draw do
  mount_devise_token_auth_for "Employee", at: "auth"

  namespace :admin, defaults: { format: :json } do
    get "home" => "home#index"
    resources :configurations, only: %i[show update]
    resources :categories
    resources :employees
    resources :products
  end

  namespace :front, defaults: { format: :json } do
    resources :categories, only: %i[index], shallow: true do
      resources :products, only: %i[index]
    end
    resources :orders, only: %i[create index update]
    get "tables/:table_id/orders" => "table_orders#orders"
    get "tables" => "table_orders#index"
  end
end
