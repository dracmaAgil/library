FactoryBot.define do
  factory :book do
    name { Faker::Name.name }
    author { Faker::Name.name }
    user_id nil
    status 'available'
    after(:build) {|book|  book.categories = [create(:category)]}
   
  end
end
