Rails.application.routes.draw do

  devise_for :users
  mount Ckeditor::Engine => '/ckeditor'
  root 'home#welcome'

  resources :topics do
    resources :articles
  end

  resources :photo_albums do
    resources :photos
  end

end
