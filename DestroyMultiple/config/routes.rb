DestroyMultiple::Application.routes.draw do
  resources :widgets
  resources :gadgets, :only => [ :new, :create ]
  
  resources :widgets do
    resources :gadgets do
      collection do
        post :destroy_multiple
      end
    end
  end
  
  match "/:id" => 'widget#gadgets'
  root to: 'widgets#index'

end
