Rails.application.routes.draw do
  resources :mutters do
    get 'api1', on: :collection
  end
  mount ActionCable.server => '/cable'
  
  resources :helloworlds
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
