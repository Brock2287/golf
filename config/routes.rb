Rails.application.routes.draw do
  resources :reviews
  #devise_for :users
  # This overrides Devise controllers into our tracked repo
  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }
  resources :users
  resources :games
  resources :courses do
    resources :reviews, except: [:show, :index]
  end

  get 'welcome/index'
  get 'pages/main'
  get 'pages/userview'
  get 'pages/friend'
  get 'test/testpage'
  get 'test/sampleuserview'
  authenticated :user do
    root :to => "pages#userview"
  end

  #for voting/liking
  resources :events do
    member do
      put 'like' => 'events#vote'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  root 'welcome#index'
end
