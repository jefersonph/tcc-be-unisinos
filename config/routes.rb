Rails.application.routes.draw do

  resources :users do
    resources :remedies
    resources :allergies
    resources :diseases
  end

  # root 'welcome#index'
  #  root :to => 'users#index' 
  
end
