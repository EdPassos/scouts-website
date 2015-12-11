Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  devise_for :users
  get 'pages/index'
  get 'contactos' => 'pages#contacts'
  get 'history' => 'pages#history'
  get 'maps' => 'pages#maps'

  # Admin
  get 'admin/users' => 'admin#users', as: 'admin_users'
  get 'admin/posts' => 'admin#posts', as: 'admin_posts'
  get 'admin/posts/:id' => 'admin#post_show', as: 'admin_show_post'
  resources :users

  # Age groups
  get 'alcateia' => 'pages#alcateia'
  get 'expedicao' => 'pages#expedicao'
  get 'comunidade' => 'pages#comunidade'
  get 'cla' => 'pages#cla'

  # Posts
  resources :posts

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
