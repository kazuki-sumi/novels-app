Rails.application.routes.draw do
    root to: 'toppages#index'
    
    get 'login' => 'sessions#new'
    post 'login' => 'sessions#create'
    delete 'logout' => 'sessions#destroy'
    
    get 'signup' => 'users#new'
    resources :users, only: [:show, :create, :destroy, :update] 
    
    get 'rankings/favorite_novels' => 'rankings#favorite'
    
    resources :novels, only: [:index, :destroy, :edit, :new, :update, :create, :show]
    resources :favorites, only: [:create, :destroy]
end
