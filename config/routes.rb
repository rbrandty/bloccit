Rails.application.routes.draw do
  resources :advertisements
  resources :posts
  resources :questions

  get 'about' => 'welcome#about'
  get 'faq' => 'welcome#faq'

end
