FactoryBot.define do
  factory :tea do
    title { Faker::Tea.variety  }
    description { Faker::TvShows::Seinfeld.quote  }
    temperature { rand(100..200) }
    brew_time { rand(1..5) }
  end
end
