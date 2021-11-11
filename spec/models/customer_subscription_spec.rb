require 'rails_helper'

RSpec.describe CustomerSubscription, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:customer_id)}
    it { should validate_presence_of(:tea_id)}
    it { should validate_presence_of(:subscription_id)}
    it { should validate_presence_of(:active)}
  end

  describe 'associations' do
    it { should have_many(:customer_subscriptions) }
    it { should have_many(:customers).through(:customer_subscriptions) }
    it { should have_many(:subscriptions).through(:customer_subscriptions) }
  end
end
