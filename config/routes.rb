Rails.application.routes.draw do
  get 'errors/not_found'

  get 'errors/internal_server_error'

  resources :books
  resources :camp_nights
  resources :adventures

  post 'load_teams' => 'teams#section_teams', as: :load_teams
  resources :teams, :except => [:index, :new, :create]
  resources :sections do
    resources :teams, :only => [:index, :new, :create]
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # Photos
  patch '/photo_albums/:id/newphoto' => 'photo_albums#newphoto'
  resources :photos

  devise_for :users
  get 'pages/index'
  get 'contactos' => 'pages#contacts'
  get 'history' => 'pages#history'
  get 'maps' => 'pages#maps'

  # Admin
  get 'admin' => 'admin#index', as: :admin

  scope 'admin' do 
    resources :users
    resources :posts do
      collection do
        get 'draft'
      end
      resources :categories
    end
    resources :people
  end

  # User
  get 'users/:id/roles' => 'users#roles', as: 'user_roles'
  patch 'users/:id/roles' => 'users#add_role'
  delete 'users/:id/roles' => 'users#remove_role'

  # Age groups
  get 'alcateia' => 'pages#alcateia'
  get 'expedicao' => 'pages#expedicao'
  get 'comunidade' => 'pages#comunidade'
  get 'cla' => 'pages#cla'

  # Blog
  get 'blog' => 'blog#index', as: :blog
  get 'blog/:id' => 'blog#post', as: :blog_post

  # Photos
  resources :photo_albums

  # Shop
  resources :shop_products, :except => [:index]
  get 'shop' => 'shop_products#index'
  get 'shop/cart' => 'shop_products#show_cart', as: 'shopping_cart'
  get 'shop/:id/add_to_cart' => 'shop_products#add_to_cart', as: 'add_product_to_cart'
  get 'shop/:id/remove_from_cart' => 'shop_products#remove_from_cart', as: 'remove_product_from_cart'
  get 'shop/:id/delete_from_cart' => 'shop_products#delete_from_cart', as: 'delete_product_from_cart'

  resources :shop_orders
  get 'shop/orders' => 'shop_orders#user_index', as: 'user_shop_orders'
  get 'shop/:id/verify_payment' => 'shop_orders#verify_payment', as: 'verify_shop_order_payment'
  get 'shop/:id/ready' => 'shop_orders#ready', as: 'ready_shop_order'
  get 'shop/:id/finalize' => 'shop_orders#finalize', as: 'finalize_order'

  # Calendar
  get 'calendar/' => 'pages#calendar'
  get 'calendar/:year/:month' => 'pages#calendar'
  resources :events

  match "404/", :to => "errors#not_found", :via => :all
  match "500/", :to => "errors#internal_server_error", :via => :all
  # You can have the root of your site routed with "root"
  root 'pages#index'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
