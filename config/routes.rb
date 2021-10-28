Rails.application.routes.draw do
  #Custom Routes
  root 'pages#home' 
  get 'about', to: 'pages#about'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  #RESTful routes 
  resources :articles
  resources :users, except: [:new]
end

