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

    context 'when there are no subscriptions' do
      before(:each) do
        @customer = create(:customer)
      end
      it 'returns an empty result' do
        get "/api/v1/customers/#{@customer.id}/customer_subscriptions"
        results = JSON.parse(response.body, symbolize_names: true)

        expect(results[:data].count).to eq(0)
      end
    end
  end

  describe 'create action' do
    context 'successful creation' do
      before(:each) do
        @customer = create(:customer)
        @tea_1 = create(:tea)
        @subscription = create(:subscription)
      end

      it 'creates a customer subscription and returns the information in json' do
        post "/api/v1/customers/#{@customer.id}/customer_subscriptions", params: { customer_id: @customer.id, tea_id: @tea_1.id, subscription_id: @subscription.id }
        results = JSON.parse(response.body, symbolize_names: true)

        expect(results[:data].keys).to eq([:id, :type, :attributes])
        expect(results[:data][:attributes][:tea_id]).to eq(@tea_1.id)
        expect(results[:data][:attributes][:customer_id]).to eq(@customer.id)
        expect(results[:data][:attributes][:subscription_id]).to eq(@subscription.id)
      end
    end

    context 'unsuccessful creation' do
      before(:each) do
        @customer = create(:customer)
        @tea_1 = create(:tea)
        @subscription = create(:subscription)
      end

      it 'returns an error in json for unfound tea' do
        post "/api/v1/customers/#{@customer.id}/customer_subscriptions", params: { customer_id: @customer.id, tea_id: (@tea_1.id - 1), subscription_id: @subscription.id }
        results = JSON.parse(response.body, symbolize_names: true)

        expect(results[:errors]).to eq(["Couldn't find Tea with 'id'=#{(@tea_1.id - 1)}"])
      end

      it 'returns an error in json for unfound customer' do
        post "/api/v1/customers/#{@customer.id - 1}/customer_subscriptions", params: { customer_id: @customer.id, tea_id: (@tea_1.id - 1), subscription_id: @subscription.id }
        results = JSON.parse(response.body, symbolize_names: true)

        expect(results[:errors]).to eq(["Couldn't find Customer with 'id'=#{@customer.id - 1}"])
      end

      it 'returns an error in json for unfound subscription' do
        post "/api/v1/customers/#{@customer.id}/customer_subscriptions", params: { customer_id: @customer.id, tea_id: @tea_1.id, subscription_id: (@subscription.id - 1) }
        results = JSON.parse(response.body, symbolize_names: true)

        expect(results[:errors]).to eq(["Couldn't find Subscription with 'id'=#{(@subscription.id - 1)}"])
      end
    end
  end

  describe 'update action' do
    context 'successful update' do
      before(:each) do
        @customer = create(:customer)
        @tea_1 = create(:tea)
        @tea_2 = create(:tea)
        subscription = create(:subscription)
        @customer_subscription_1 = create(:customer_subscription, id: 1, customer: @customer, tea: @tea_1, subscription: subscription)
      end

      it 'changes the active status from true to false, cancelling the customer subscription' do
        expect(@customer_subscription_1.active).to eq(true)

        patch "/api/v1/customers/#{@customer.id}/customer_subscriptions/#{@customer_subscription_1.id}", params: { active: false }
        results = JSON.parse(response.body, symbolize_names: true)

        expect(results[:data][:attributes][:active]).to eq(false)
      end

      it 'updates an attribute about the subscription' do
        expect(@customer_subscription_1.active).to eq(true)

        patch "/api/v1/customers/#{@customer.id}/customer_subscriptions/#{@customer_subscription_1.id}", params: { tea_id: @tea_2.id }
        results = JSON.parse(response.body, symbolize_names: true)

        expect(results[:data][:attributes][:tea_id]).to eq(@tea_2.id)
      end
    end

    context 'unsuccessful update' do
      before(:each) do
        @customer = create(:customer)
        @tea_1 = create(:tea)
        @tea_2 = create(:tea)
        subscription = create(:subscription)
        @customer_subscription_1 = create(:customer_subscription, id: 1, customer: @customer, tea: @tea_1, subscription: subscription)
      end

      it 'does not update with incorrect params provided' do
        expect(@customer_subscription_1.tea_id).to eq(@tea_1.id)

        patch "/api/v1/customers/#{@customer.id}/customer_subscriptions/#{@customer_subscription_1.id}", params: { tea_id: (@tea_2.id * 20) }
        results = JSON.parse(response.body, symbolize_names: true)
        expect(results[:errors]).to eq(["Tea must exist"])
      end
    end
  end
end
