FactoryBot.define do
  factory :user do
    first_name { 'Orange' }
    last_name { 'Mecanique' }
    email { 'orange@mecanique.com' }
    password { 'password123' }
    password_confirmation { 'password123' }
    role { 0 }
  end
end
