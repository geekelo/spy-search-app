Rails.application.routes.draw do
  get 'analytics/index'
  get 'analytics/queries'
  get 'search/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  post '/search/record_search', to: 'search#record_search'

  get 'analytics', to: 'analytics#index'
  get 'analytics/queries', to: 'analytics#queries'

  # Defines the root path route as the search page ("/")
  root "search#index"
end
