class Subscription < ApplicationRecord
  has_many :customer_subscriptions
  has_many :customers, through: :customer_subscriptions
  has_many :teas, through: :customer_subscriptions

  validates :title, presence: true, uniqueness: true
  validates :price, presence: true, numericality: true
  validates :frequency, presence: true

  enum frequency: { 'Weekly' => 0, 'Bi-Weekly' => 1, 'Monthly' => 2 }
end
