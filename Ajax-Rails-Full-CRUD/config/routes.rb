DestroyMultiple::Application.routes.draw do
  resources :widgets
  resources :gadgets, :only => [ :new, :create ]
  
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
