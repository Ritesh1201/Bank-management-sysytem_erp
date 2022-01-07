Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # devise_for :users
  
  
  root 'home#index'
  resources :banks do
    resources :branches
  end

  resources :branches do
    resources :users do
      member do 
        get 'select_type'
        get 'existing_customer'
        get 'new_customer'
      end
    end
  end

  resources :branches do
    resources :accounts
  end

  devise_for :users, controllers: {sessions: "users/sessions", registrations: "users/registrations", omniauth_callbacks: 'omniauth' }

  resources :branches do
    resources :users do
      resources :accounts
    end
  end

 

  resources :accounts do
    resources :transactions
  end

end
