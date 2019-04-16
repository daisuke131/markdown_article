FactoryBot.define do
  factory :article do
    title { "MyString" }
    body { "MyText" }
    status { 1 }
    like_count { 1 }
  end
end
