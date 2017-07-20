Rails.application.routes.draw do
  resources :advertisements
  resources :posts

  get 'about' => 'welcome#about'
  get 'faq' => 'welcome#faq'

end
