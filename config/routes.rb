Rails.application.routes.draw do
  resources :comments
  resources :posts do
    collection do 
      get 'search'
    end
  	member do
  		put "like", to: "posts#upvote"
  		put "dislike", to: "posts#downvote"
  	end
    resources :comments
  end
  resources :my_models
  devise_for :users
 
  root 'posts#index'
  

  get '/about', to: 'pages#about'

end
