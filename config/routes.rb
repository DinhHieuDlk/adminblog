Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
    # authenticated :user do
    # end


    devise_for :users, path: 'admin', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }, skip: :registrations
      devise_scope :user do
    get '/admin' => 'devise/sessions#new'
  end

    authenticated :user do
      root "admin/dashboard#index", as: :root_admin
        namespace :admin do
          resources :posts
          resources :tags , except:[:index]
          resources :comments, only:[:index, :update, :destroy]
          resources :visitors , only:[:index, :destroy]
          resources :messages, only:[:index, :show, :update, :destroy]
          resources :notifications, only:[:index, :destroy]
          resources :dashboard, only:[:index]
          resources :settings, only:[:new, :create, :edit, :update]
        end
    end
    root "pages#index"
    resources :posts, only:[:index, :show]
    resources :messages, only: [:new, :create]
    resources :comments, only:[:create]
    get 'about' => 'pages#about', as: :about
  match 'dismiss_all_notifications', to:'admin/notifications#delete_all', via: :delete
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
