FactoryBot.define do
  factory :article do
    title { "MyString" }
    slug { "MyString" }
    content { nil }
    poster { nil }
    poster_description { "MyString" }
    user { nil }
  end
end
