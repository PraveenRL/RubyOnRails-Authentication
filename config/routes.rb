Rails.application.routes.draw do

  root 'welcome#index'

  resources :users do 
    member do
      get :confirm_email
    end
  end

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

end
