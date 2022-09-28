Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#page'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :items do
    member do
      resources :orders, only: [:new]
    end
  end
  resources :orders, only: [:create]

end
