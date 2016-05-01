Rails.application.routes.draw do

  root 'home#welcome'

  resources :topics do
    resources :articles
  end

end
