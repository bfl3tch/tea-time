require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_numericality_of(:price) }
    it { should validate_presence_of(:frequency) }
    it { should define_enum_for(:frequency).with_values(['Weekly', 'Bi-Weekly', 'Monthly']) }

  end

  describe 'associations' do
    it { should have_many(:customer_subscriptions) }
    it { should have_many(:customers).through(:customer_subscriptions) }
    it { should have_many(:teas).through(:customer_subscriptions) }
  end
end
