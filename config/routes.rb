Rails.application.routes.draw do

namespace :api do
  namespace :v1 do
    resources :customers, only: [:index] do
      scope module: 'customers' do

        resources :customer_subscriptions, only: [:index, :create, :update]
      end

    end
    end
  end
end
