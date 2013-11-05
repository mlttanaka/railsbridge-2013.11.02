HowAboutPurple::Application.routes.draw do
  devise_for :users
  
  resources :posts do
    resources :replies
  end
  
  root 'home#index'
  
end
