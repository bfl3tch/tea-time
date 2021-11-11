class Tea < ApplicationRecord
  has_many :customer_subscriptions
  has_many :customers, through: :customer_subscriptions
  has_many :subscriptions, through: :customer_subscriptions
  
  validates :title, presence: true, uniqueness: true
  validates_presence_of :description
  validates :temperature, numericality: true
  validates :brew_time, numericality: true

end
