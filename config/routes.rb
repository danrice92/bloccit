Rails.application.routes.draw do
  
  resources :labels, only: [:show]

  resources :topics do
    resources :posts, except: [:index]
  end
  
  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    
    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end
  
  resources :users, only: [:new, :create, :show]
  
  resources :sessions, only: [:new, :create, :destroy]
  
  get 'about' => 'welcome#about'
  
  root 'welcome#index'
  
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show]
      resources :topics, only: [:index, :show]
      resources :posts, only: [:index, :show]
      resources :comments, only: [:index, :show]
    end
  end

end


# Implement the read-only portion for Posts and Comments using TDD. The new endpoints should be RESTful and should return JSON. You'll need endpoints for:

#GET api/v1/posts/:id
#GET api/v1/posts/
#GET api/v1/comments/:id
#GET api/v1/comments
#api/v1/topics/:id should include an array of child posts.
#api/v1/posts/:id should include an array of child comments.
#All endpoints should return JSON and index routes should return arrays of objects in JSON.

