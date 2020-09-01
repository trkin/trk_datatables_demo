Rails.application.routes.draw do
  root 'pages#home'
  get 'pages/home'
  resources :users do
    collection do
      post :search
    end
  end
  resources :posts do
    collection do
      post :search
      get :most_liked
      post :most_liked_search
    end
  end
end
