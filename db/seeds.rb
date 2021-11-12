
customer_1 = Customer.create!(id: 1, first_name: 'Jerry', last_name: 'Seinfeld', email: 'jerry@example.com', address: '111 Main St. NY, NY 10010')
customer_2 = Customer.create!(id: 2, first_name: 'Cosmo', last_name: 'Kramer', email: 'kramer@example.com', address: '222 Main St. NY, NY 10010')
customer_3 = Customer.create!(id: 3, first_name: 'George', last_name: 'Costanza', email: 'george@example.com', address: '333 Main St. NY, NY 10010')

tea_1 = Tea.create!(id: 1, title: 'Earth', description: 'An earthy Tea', temperature: 200, brew_time: 120)
tea_2 = Tea.create!(id: 2, title: 'Wind', description: 'A windy Tea', temperature: 250, brew_time: 125)
tea_3 = Tea.create!(id: 3, title: 'Fire', description: 'A firey Tea', temperature: 225, brew_time: 130)
tea_4 = Tea.create!(id: 4, title: 'Herbal', description: 'An herbal Tea', temperature: 230, brew_time: 150)
tea_5 = Tea.create!(id: 5, title: 'English', description: 'An English Tea', temperature: 245, brew_time: 180)

subscription_1 = Subscription.create!(id: 1, title: 'Weekly subscription', price: 10.99, frequency: 0)
subscription_2 = Subscription.create!(id: 2, title: 'Monthly subscription', price: 5.99, frequency: 2)

customer_1.customer_subscriptions.create!(tea_id: tea_1.id, subscription_id: subscription_1.id )
customer_1.customer_subscriptions.create!(tea_id: tea_2.id, subscription_id: subscription_1.id )
customer_1.customer_subscriptions.create!(tea_id: tea_3.id, subscription_id: subscription_2.id )
customer_1.customer_subscriptions.create!(tea_id: tea_4.id, subscription_id: subscription_2.id )
customer_1.customer_subscriptions.create!(tea_id: tea_5.id, subscription_id: subscription_2.id )
customer_2.customer_subscriptions.create!(tea_id: tea_1.id, subscription_id: subscription_1.id )
customer_2.customer_subscriptions.create!(tea_id: tea_1.id, subscription_id: subscription_2.id )
customer_3.customer_subscriptions.create!(tea_id: tea_4.id, subscription_id: subscription_1.id )
customer_3.customer_subscriptions.create!(tea_id: tea_3.id, subscription_id: subscription_2.id )
customer_3.customer_subscriptions.create!(tea_id: tea_2.id, subscription_id: subscription_2.id )
