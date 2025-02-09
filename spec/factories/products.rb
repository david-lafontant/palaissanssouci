FactoryBot.define do
  factory :product do
    name { "MyString" }
    description { "MyText" }
    price { "9.99" }
    pictures { nil }
    category { nil }
  end
end
