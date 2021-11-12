class CustomerSubscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea
  belongs_to :subscription

  validates_presence_of :customer_id
  validates_presence_of :tea_id
  validates_presence_of :subscription_id

  validates_inclusion_of :active, in: [true, false]
end
