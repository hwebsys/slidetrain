Slidetrain::Application.routes.draw do
  root to: "top#index"
  resources :slides, only: [:index]
end
