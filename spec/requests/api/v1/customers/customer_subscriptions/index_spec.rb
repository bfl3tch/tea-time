require 'rails_helper'

RSpec.describe 'Customer Subscriptions API' do
  describe 'index action' do
    context 'when there are subcriptions' do
      before(:each) do
        @customer = create(:customer)
        tea_1 = create(:tea)
        tea_2 = create(:tea)
        subscription = create(:subscription)
        @customer_subscription_1 = create(:customer_subscription, customer: @customer, tea: tea_1, subscription: subscription)
        @customer_subscription_2 = create(:customer_subscription, customer: @customer, tea: tea_2, subscription: subscription)
      end

      it 'shows all the customers subscriptions' do
        get "/api/v1/customers/#{@customer.id}/customer_subscriptions"
        results = JSON.parse(response.body, symbolize_names: true)

        expect(results[:data].count).to eq(2)
        expect(results[:data].first[:type]).to eq("customer_subscriptions")
        expect(results[:data].first[:attributes].keys).to eq([:tea_id, :customer_id, :subscription_id, :active])
      end

      it 'shows all the customers subscriptions both active and inactive' do
        expect(@customer_subscription_1.active).to eq(true)

        get "/api/v1/customers/#{@customer.id}/customer_subscriptions"
        results = JSON.parse(response.body, symbolize_names: true)
        expect(results[:data].count).to eq(2)

        @customer_subscription_1.active = false
        
        get "/api/v1/customers/#{@customer.id}/customer_subscriptions"
        results = JSON.parse(response.body, symbolize_names: true)

        expect(results[:data].count).to eq(2)
      end

    end
  end
end
