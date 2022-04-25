Rails.application.routes.draw do
  scope module: :public do
   root :to => 'homes#top'
   get 'homes/about' => 'homes#about'
   post "order/comfirm" => "orders#comfirm"
   get "order/thanks" => "order#thanks"
   resources :products, only:[:index,:show]
   resources :in_cart_products, only:[:index,:create,:update,:destroy]
   delete '/in_cart_products' => 'in_cart_products#all_destroy'
   resources :orders, only:[:new,:index,:create,:show]
   resource :end_user, only:[:show,:edit,:update,:unsubcribe,:withdrawl]
   get 'end_users/unsubcribe' => 'end_users#unsubcribe'
   patch 'end_users/withdrawl' => 'end_users#withdrawl'
   get 'edit/end_users' => 'end_users#edit'
   patch 'update/end_users' => 'end_users#update'
   get '/end_users/my_page' => 'end_users#show'
   resources :addresses,only: [:index,:create,:edit,:update,:destroy]
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
