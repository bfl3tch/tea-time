class AddDefaultActiveToSubscription < ActiveRecord::Migration[5.2]
  def change
    change_column :customer_subscriptions, :active, :boolean, default: true, null: false
  end
end
