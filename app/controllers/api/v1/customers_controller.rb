class Api::V1::CustomersController < ApplicationController

  def index
    customers = Customer.all

    render json: CustomersSerializer.new(customers), status: :ok
  end
end
