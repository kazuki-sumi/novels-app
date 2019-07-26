Rails.application.routes.draw do
    root to: 'toppages#index'

    #sessions
    get 'login' => 'sessions#new'
    post 'login' => 'sessions#create'
    delete 'logout' => 'sessions#destroy'

    #users
    get 'signup' => 'users#new'
    resources :users, only: [:show, :create, :destroy, :update, :edit] do
      member do
        get :followings
        get :followers
      end
    end

    #rankings
    get 'rankings/favorite_novels' => 'rankings#favorite'

    #novels
    resources :novels, except: [:show]
    get 'search' => 'novels#search'
    get 'novel/:id' => 'novels#index'
    get 'novel/:id/:sequential_id' => 'novels#show'

    #drafts
    get 'draft_list' => 'drafts#index'
    post 'drafts/:novel_id' => 'drafts#create'
    get 'draft/:novel_id/new' => 'drafts#new'
    get 'draft/:novel_id' => 'drafts#show'
    get 'draft/:novel_id/:sequential_id/post' => 'drafts#post'
    get 'draft/:novel_id/:sequential_id/edit' => 'drafts#edit'
    patch 'draft/:novel_id/:sequential_id' => 'drafts#update'
    delete 'draft/:novel_id/:sequential_id' => 'drafts#destroy'

    #submit_novels
    get 'submit_novels/:user_id' => 'submit_novels#index'
    get 'submit_novel/:novel_id/:sequential_id/new' => 'submit_novels#new'
    post 'submit_novel/:novel_id/:sequential_id' => 'submit_novels#create'
    get 'submit_novel/:id/edit' => 'submit_novels#edit'
    patch 'submit_novel/:id' => 'submit_novels#update'
    delete 'submit_novel/:id' => 'submit_novels#destroy'
    get 'submit_novel/:novel_id' => 'submit_novels#show'

    #favorites
    resources :favorites, only: [:create, :destroy]

    #relationships
    resources :relationships, only: [:create, :destroy]

    # api
    namespace :api do
      resources :users, only: %i[index show]
      resources :novels, only: %i[index show]
    end
end
