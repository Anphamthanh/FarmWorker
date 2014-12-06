FarmWorker::Application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'
  get 'admin/dashboard' => 'admin#dashboard'
  get 'faculty/dashboard' => 'faculty#dashboard'
  get 'student/dashboard' => 'student#dashboard'
  post 'admin/register' => 'admin#register'
  post 'patient' => 'patient#create'
  put 'patient/:id' => 'patient#update', as: 'patient_update'
  get 'patient/:id/input/:type' => 'patient#input', as: 'patient_input'
  post 'patient/:id/update/:type' => 'patient#update_record', as: 'patient_update_record'
  get 'patient/:id' => 'patient#view', as: 'patient_view'
  delete 'patient/:id' => 'patient#delete'
  get 'user/:id' => 'admin#edit'
  put 'user/:id' => 'admin#update', as: 'user_update'
  delete 'user/:id' => 'admin#delete'

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
