Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :items do
        resources :merchants, only: :index, controller: :items, action: :merchant
      end
      namespace :merchants do
        get '/find', to: 'search#show'
      end
      resources :merchants do
        resources :items, only: :index, controller: :merchants, action: :items
      end
    end
  end
end
