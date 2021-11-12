class Api::V1::Customers::CustomerSubscriptionsController < ApplicationController

  def index
    customer_subscriptions = Customer.find(params[:customer_id]).customer_subscriptions
    render json: CustomerSubscriptionsSerializer.new(customer_subscriptions), status: :ok
  end

  def create
    customer = Customer.find(params[:customer_id])
    tea = Tea.find(params[:tea_id])
    subscription = Subscription.find(params[:subscription_id])
    customer_subscription = customer.customer_subscriptions.create!(customer_subscription_params)
    render json: CustomerSubscriptionsSerializer.new(customer_subscription), status: :created
  end

  private

  def customer_subscription_params
    params.permit(:customer_id, :tea_id, :subscription_id, :active)
  end
end
