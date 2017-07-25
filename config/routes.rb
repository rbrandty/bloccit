Rails.application.routes.draw do
  resources :advertisements
  resources :questions
  resources :topics do
  # #34
  resources :posts, except: [:index]
  resources :sponsored_posts, except: [:index]
  end

  get 'about' => 'welcome#about'
  get 'faq' => 'welcome#faq'

end
