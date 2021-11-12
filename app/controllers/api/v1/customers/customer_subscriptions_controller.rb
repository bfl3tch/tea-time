class Api::V1::Customers::CustomerSubscriptionsController < ApplicationController
  before_action :find_customer, only: [:index, :create, :update]

  def index
    customer = Customer.find(params[:customer_id])
    customer_subscriptions = @customer.customer_subscriptions if customer

    render json: CustomerSubscriptionsSerializer.new(customer_subscriptions), status: :ok
  end

  def create
    customer = Customer.find(params[:customer_id])
    tea = Tea.find(params[:tea_id])
    subscription = Subscription.find(params[:subscription_id])
    customer_subscription = customer.customer_subscriptions.create!(customer_subscription_params)

    render json: CustomerSubscriptionsSerializer.new(customer_subscription), status: :created
  end

  def update
    customer = Customer.find(params[:customer_id])
    customer_subscription = customer.customer_subscriptions.where(id: params[:id]).first
    customer_subscription.update!(customer_subscription_params)

    render json: CustomerSubscriptionsSerializer.new(customer_subscription), status: :ok
  end

  private

  def customer_subscription_params
    params.permit(:id, :customer_id, :tea_id, :subscription_id, :active)
  end

  def find_customer
    @customer = Customer.find(params[:customer_id])
  end
end
