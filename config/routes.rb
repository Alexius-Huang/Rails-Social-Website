Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  mount Ckeditor::Engine => '/ckeditor'
  root 'home#welcome'

  resources :users do

    resources :interests, only: [:create]
    resources :skills,    only: [:create]

  	resources :topics do
    	resources :articles
  	end

  	resources :photo_albums do
    	resources :photos
  	end

	end

end
