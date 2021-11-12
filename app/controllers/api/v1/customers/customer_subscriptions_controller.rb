class Api::V1::Customers::CustomerSubscriptionsController < ApplicationController

  def index
    customer_subscriptions = Customer.find(params[:customer_id]).customer_subscriptions
    render json: CustomerSubscriptionsSerializer.new(customer_subscriptions), status: :ok
  end
end
