require 'rails_helper'

RSpec.describe CustomerSubscription, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:customer_id) }
    it { should validate_presence_of(:tea_id) }
    it { should validate_presence_of(:subscription_id) }
    it { should validate_inclusion_of(:active).in_array([true,false]) }
  end

  describe 'associations' do
    it { should belong_to(:customer) }
    it { should belong_to(:tea) }
    it { should belong_to(:subscription) }
  end
end
