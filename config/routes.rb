<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
Rails.application.routes.draw do
  get 'users/new'
  get 'sessions/create'
  get 'sessions/destroy'

  get 'home/show'

  root 'discrete#index'
  get '/logic', to: 'logic#logic'
  get '/logic_options', to: 'logic#option'
  get '/logic/problem', to: 'logic#logic_problems'
  get '/induction', to: 'induction#index'
  get '/induction/problem', to: 'induction#test_action'
  get '/profile', to: 'profile#profilePage'
  get '/instructor', to: 'instructor#instructor'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  post '/logic', to: 'logic#logic'

  resources :sessions, only: [:create, :destroy]
  
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
=======
Rails.application.routes.draw do
  get 'users/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'home/show'

  root 'discrete#index'
  get '/logic', to: 'logic#logic'
  get '/logic_options', to: 'logic#option'
  get '/induction', to: 'induction#index'
  get '/induction/problem', to: 'induction#test_action'
  get '/profile', to: 'profile#options'
  get '/student_profile', to: 'profile#profilePage'
  get '/instructor_profile', to: 'profile#instructorPage'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  post '/logic', to: 'logic#logic'

  resources :sessions, only: [:create, :destroy]
  
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
>>>>>>> induction
=======
Rails.application.routes.draw do
  get 'users/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'home/show'

  root 'discrete#index'
  get '/logic', to: 'logic#logic'
  get '/logic_options', to: 'logic#option'
  get '/induction', to: 'induction#index'
  get '/induction/problem', to: 'induction#test_action'
  get '/profile', to: 'profile#options'
  get '/student_profile', to: 'profile#profilePage'
  get '/instructor_profile', to: 'users#index'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  post '/logic', to: 'logic#logic'

  resources :sessions, only: [:create, :destroy]
  
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
>>>>>>> induction
=======
Rails.application.routes.draw do
  get 'users/new'
  get 'users/destroy'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'home/show'

  root 'discrete#index'
  get '/logic', to: 'logic#logic'
  get '/logic_options', to: 'logic#option'
  get '/induction', to: 'induction#index'
  get '/induction/problem', to: 'induction#test_action'
  get '/profile', to: 'profile#options'
  get '/student_profile', to: 'profile#profilePage'
  get '/instructor_profile', to: 'users#index'
  put '/user/problems', to: 'users#complete_problem'
  get 'users_destroy_path', to:'users#destroy'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  post '/logic', to: 'logic#logic'

  resources :sessions, only: [:create, :destroy]
  
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
>>>>>>> induction
