Rails.application.routes.draw do
  resources :categories
  resources :scores
  devise_for :users, controllers: { registrations: "registrations" }
  resources :parts
  resources :workouts do
    resources :parts 
  end
  resources :parts do
    resources :lifts
    resources :wods
  end
  devise_for :admins
  resources :lifts
  resources :wods
  resources :wods do
    resources :scores 
  end
  resources :lifts do
    resources :scores
  end
  resources :users do
    resources :scores
  end
  resources :scores do
    resources :users 
  end
  resources :lifts do
    resources :categories
  end
  resources :categories do 
    resources :lifts
  end

  resources :workouts do 
    member do 
      get 'leaderboard'
    end
  end

  match "future-workouts" => "workouts#future", :via => :get, :as => :future_workouts


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'workouts#index'

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
