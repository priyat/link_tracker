FactoryBot.define do
  factory :link do
    store_url { "MyString" }
    tracking_code { "MyString" }
    visit { 1 }
  end
end
