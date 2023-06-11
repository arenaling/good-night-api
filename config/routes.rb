Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, only: [:create, :index] do
    collection do
      post 'follow'
      post 'list_followed'
    end
  end

  post '/activities/sleep', to: 'activities#sleep'
  post '/activities/wake', to: 'activities#wake'
end
