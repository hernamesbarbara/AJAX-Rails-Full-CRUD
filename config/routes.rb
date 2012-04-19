AjaxRailsFullCrud::Application.routes.draw do
  resources :widgets
  resources :gadgets, :only => [ :new, :create, :edit, :update ]
  
  resources :widgets do
    collection do
      post :destroy_multiple
    end
    resources :gadgets do
      collection do
        post :destroy_multiple
      end
    end
  end
  
  match "/:id" => 'widget#gadgets'
  match "/destroy_multiple" => "widgets#destroy_multiple", :as => "destroy_multiple"
  root to: 'widgets#index'

end
