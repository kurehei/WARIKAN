Rails.application.routes.draw do
  root 'homepages#index'
  devise_for :users
  resources :travels do
    resources :members do
      resources :contents
    end
  end
  resources :payments
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
