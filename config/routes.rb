Slidetrain::Application.routes.draw do
  root to: "top#index"
  get :jsonsample, to: 'top#jsonsample'
end
