Rails.application.routes.draw do
  get 'vue/index'
  resources :mutters do
    get 'api1', on: :collection
  end
  mount ActionCable.server => '/cable'
  
  resources :helloworlds
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # for VueRouter
  get 'helloworlds_vue/',      to: 'vue#index'
  get 'helloworlds_vue/*path', to: 'vue#index'
  get 'mutters_vue/',          to: 'vue#index'
  get 'mutters_vue/*path',     to: 'vue#index'
  get 'app_vue/',     to: 'vue#index'
  get 'app_vue/*path',     to: 'vue#index'
  # end
end
