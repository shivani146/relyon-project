Rails.application.routes.draw do

  devise_for :employees, :controllers => { registrations: 'registrations' }

  resources :employees
  resources :leave_types
  resources :apply_leaves
  resources :salary_heads
  resources :salary_allotments

  match '/apply_leaves/apply_leave_index/:id', to: 'apply_leaves#apply_leave_index', via: 'get'
  match '/my_leaves/my_leaves_index/:id', to: 'apply_leaves#my_leaves_index', via: 'get'
  match '/get_leave_details', to: 'apply_leaves#get_leave_details', via: 'post'

  match '/submit_apply_leave', to: 'apply_leaves#submit_apply_leave',via: 'post'
  match '/salary_allotments/create_salary/:id', to: 'salary_allotments#create_salary', via: 'get'
  match '/salary_allotments/my_salary/:id', to: 'salary_allotments#my_salary', via: 'get'
  match '/salary_allotments/calculated_salary/:id', to: 'salary_allotments#calculated_salary', via: 'get'

  match '/new_record', to: 'employees#new_record', via: 'get'

  root to: "employees#index"


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
