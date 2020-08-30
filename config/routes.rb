Rails.application.routes.draw do
  root 'pages#home'
  get 'pages/home'
  resources :users do
    collection do
      post :search
    end
  end
end
