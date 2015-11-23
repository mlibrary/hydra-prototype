Rails.application.routes.draw do

  blacklight_for :catalog
  devise_for :users
  mount Hydra::Collections::Engine => '/'
  mount CurationConcerns::Engine, at: '/'
  resources :welcome, only: 'index'
  root to: 'welcome#index'
  curation_concerns_collections

  scope module: 'deep_blue' do

    resources :collections do
      member do
        get 'permissions' => 'collections#list_permissions'
        post 'permissions' => 'collections#update_permissions'
      end
    end

    resources 'items' do
      member do
        get 'permissions' => 'items#list_permissions'
        post 'permissions' => 'items#update_permissions'
      end
    end

  end

  # resources :collections, only: :show do
  #   member do
  #     get 'page/:page', action: :index
  #     get 'facet/:id', action: :facet, as: :dashboard_facet
  #   end
  #   collection do
  #     put '', action: :update
  #     put :remove_member
  #   end
  # end

  curation_concerns_basic_routes
  curation_concerns_embargo_management
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
