Rails.application.routes.draw do
  root 'welcome#index'

  resources :advertisements
  resources :questions
  resources :topics do
    # #34
    resources :posts, except: [:index]
    resources :sponsored_posts, except: [:index]
  end

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  post 'confirm' => 'users#confirm'
  x
  get 'about' => 'welcome#about'
  get 'faq' => 'welcome#faq'
end
