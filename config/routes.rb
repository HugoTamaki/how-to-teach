HowToTeach::Application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  # get "friendships/create/:friend_id", to: "friendships#create", as: "new_frienship"
  # get "friendships/create"
  # get "friendships/destroy"
  resources :friendships do
    get 'accept', as: 'accept'
  end

  resources :methodologies, except: :index do
    get 'methodologies/paginate_methodologies' => 'methodologies#paginate_methodologies'
    resources :comments
  end

  root to: 'static_pages#index'
  get 'users/my_profile' => 'users#my_profile', as: 'my_profile'
  get 'users/profile/:id' => 'users#profile', as: 'profile'
  get 'users/search' => 'users#search', as: 'search'
  get 'users/paginate_feeds' => 'users#paginate_feeds'
  get 'users/paginate_friends' => 'users#paginate_friends'

  devise_for :users, controllers: { registrations: 'users/registrations' }
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
  #   end
end
