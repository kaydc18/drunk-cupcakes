Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :recipes, only: [:index]
      resources :recipes, only: [:show] do
        resources :recipe_books, only: [:create]
      end
      
      resources :users, only: [:show] do
        resources :recipe_books, only: [:show]
      end

      post 'recipes/name_search', to: 'recipes#name_search'
      post 'ingredients/ingredient_search', to: 'ingredients#ingredient_search'
    end
  end
  get '*page', to: 'homes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
