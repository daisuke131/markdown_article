Rails.application.routes.draw do
  root "articles#index"
  devise_for :users
  get "users/:id" => "users#show", as: "user"
  resources :articles
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
