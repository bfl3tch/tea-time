require 'rails_helper'

RSpec.describe 'Customers API' do
  describe 'index action' do
    context 'when there are customers' do
      before(:each) do
        customer = create(:customer)
        tea = create(:tea)
        subscription = create(:subscription)
        customer_subscriptions = create(:customer_subscription, customer: customer, tea: tea, subscription: subscription)
      end

      it 'shows all the customers subscriptions' do
        get '/api/v1/customers'
        require "pry"; binding.pry
        @results = JSON.parse(response.body, symbolize_names: true)

        require "pry"; binding.pry
        expect(results).to eq([])
      end


    end
  end
end
