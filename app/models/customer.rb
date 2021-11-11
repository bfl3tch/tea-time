class Customer < ApplicationRecord
  has_many :customer_subscriptions
  has_many :teas, through: :customer_subscriptions
  has_many :subscriptions, through: :customer_subscriptions
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_presence_of :address
end
