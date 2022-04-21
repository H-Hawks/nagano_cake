Rails.application.routes.draw do
  scope module: :public do
   root :to => 'homes#top'
   get 'homes/about' => 'homes#about'
   resources :products, only:[:index,:show] 
   resources :in_cart_products, only:[:index,:create,:update,:destroy]
   resources :orders, only:[:new,:create,:show]
   get '/end_user/my_page' => 'end_users#show'
   resource :end_user, only:[:edit,:update]
   resources :addresses
  end
  namespace :admin do
   resources :products
   resources :genres, only:[:index,:create,:edit,:update]
   resources :end_users, only:[:index,:show,:edit,:update]
   resources :orders, only:[:index,:show,:update]
   resources :order_details,only:[:update]
  end
  devise_for :users,skip: :all
  devise_for :end_users,skip: [:passwords], controllers:{
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  devise_for :admin,skip: [:registrations,:passwords],controllers:{
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
