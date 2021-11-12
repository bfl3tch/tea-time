class CustomerSubscriptionsSerializer
  include JSONAPI::Serializer

  attributes :tea_id, :customer_id, :subscription_id, :active

end
