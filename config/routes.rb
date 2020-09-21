Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#show'

      get '/climbing_routes', to: 'climbing#index'
    end
  end
end
