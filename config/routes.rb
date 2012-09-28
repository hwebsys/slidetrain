Slidetrain::Application.routes.draw do
  root to: "application#top"
  get :jsonsample, to: 'application#jsonsample'
end
