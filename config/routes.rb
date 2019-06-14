Rails.application.routes.draw do
  resources :brand_scores

  root 'brand_scores#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
