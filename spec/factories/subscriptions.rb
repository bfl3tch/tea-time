FactoryBot.define do
  factory :subscription do
    title { Faker::TvShows::MichaelScott.quote }
    price { rand(1.0...24.9) }
    frequency { 1 }
  end
end
