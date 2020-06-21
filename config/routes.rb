Rails.application.routes.draw do
  resources :favorites
  resources :users, only: [:index, :show, :create] do
    resources :favorites
  end

  post "login", to: "authentication#login"
end
