Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  post 'confirm' => 'users#confirm'
  get 'confirm' => 'users#new'

  resources :sessions, only: [:new, :create, :destroy]

  resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts, except: [:index]
  end

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
    resources :favorites, only: [:create, :destroy]
  end

  resources :advertisements, :questions

  get 'about' => 'welcome#about'
  get 'contact' => 'welcome#contact'
  get 'faq' => 'welcome#faq'

  resources :advertisements, only: [:index, :show, :create, :new]
  root 'welcome#index'



end
