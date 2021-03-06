Rails.application.routes.draw do
  

  resources :user_leaves
  resources :leaves
  devise_for :users,:path_prefix => 'my'

resources :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

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
  #   endget '/static_pages/show'
 get '/static_pages/show'
  #match '/static_pages/edit/:id' => 'devise/registrations#edit', :via => :get, :as => :static_pages_edit_path
  delete 'static_pages/users/destroy/:id' =>  'users#destroy'
  
 get 'static_pages/block/:id' =>  'static_pages#block'
  get 'static_pages/static_pages/block/:id' =>  'static_pages#block'

  get 'approve/:id' => 'leaves#approve_leave'

  get 'static_pages/unblock/:id' =>  'static_pages#unblock'
  get 'static_pages/static_pages/unblock/:id' =>  'static_pages#unblock'

  get 'xx/leaves/applyindex' => 'leaves#apply_index'

  root 'static_pages#home' #get 'static_pages#list'
end
