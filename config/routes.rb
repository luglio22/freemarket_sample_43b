Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :users, only: [:new, :edit, :update] do
    member do
      get "payments"
    end
    collection do
      get "main_data"
      post "sms_confirmation"
      post "certification"
      post "check"
      post "creditcard"
      get "address"
    end
  end

  resources :mypages, only: [:index, :edit, :update, :destroy] do
    resources :listings do
      collection do
        get "listing"
        get "in_progress"
        get "completed"
      end
    end
  end
  resources :products, only: [:new, :create, :edit, :update, :show, :destroy] do
    resources :images, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
    member do
      get "confirmation"
      get "detail"
      post "completion"
      get "category_detail"
    end
    collection do
      get "category_index"
    end
    collection do
      get "search"
      post "search_category"
    end
  end
  resources :registrations, only: [:index, :new]
  resources :brands, only: [:show]
  root "products#index"
end
