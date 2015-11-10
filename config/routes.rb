Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  devise_for :users
  get 'pages/index'
  get 'contactos' => 'pages#contacts'
  get 'history' => 'pages#history'
  get 'maps' => 'pages#maps'

  # Age groups
  get 'alcateia' => 'pages#alcateia'
  get 'expedicao' => 'pages#expedicao'
  get 'comunidade' => 'pages#comunidade'
  get 'cla' => 'pages#cla'

  # Shop
  get 'shop' => 'shop_products#index'
  resources :shop_products, :except => [:index]

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
