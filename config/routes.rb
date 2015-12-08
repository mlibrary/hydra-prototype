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

    # resources 'items' do
    #   member do
    #     get 'permissions' => 'items#list_permissions'
    #     post 'permissions' => 'items#update_permissions'
    #   end
    # end

  end

  curation_concerns_basic_routes
  curation_concerns_embargo_management

  namespace :curation_concerns, path: :concern do
    resources :items do
      member do
        get 'permissions' => 'items#list_permissions'
        post 'permissions' => 'items#update_permissions'
      end
    end
  end

  get 'items/:id/permit' => 'items#permit', as: :permit_item
end
