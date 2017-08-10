Rails.application.routes.draw do
  root 'welcome#index'

  get 'about' => 'welcome#about'
  get 'faq' => 'welcome#faq'
  resources :topics do
    resources :posts, except: [:index]
  end

# #4
  resources :posts, only: [] do
# #5
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  post 'confirm' => 'users#confirm'
end
