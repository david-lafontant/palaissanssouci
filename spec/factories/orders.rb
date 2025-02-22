FactoryBot.define do
  factory :order do
    first_name { "MyString" }
    last_name { "MyString" }
    address_line1 { "MyString" }
    address_line2 { "MyString" }
    city { "MyString" }
    state { "MyString" }
    country { "MyString" }
    zipcode { "MyString" }
    telephone { "MyString" }
    intruction { "MyText" }
    payment_method { 1 }
    email { "MyString" }
  end
end
