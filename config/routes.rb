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
      get :with_comments_count
      post :with_comments_count_search
      get :with_comments_body
      post :with_comments_body_search
    end
  end
end
