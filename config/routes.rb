Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"
  resources :projects
  resources :projects do
    resources :tasks

    resources :tasks do
      resources :posts
    end
  end
end
