FactoryBot.define do

  factory :product, class: Product do
    sequence(:name) { |n| "Bike #{n}" }
    description 'cool bike'
    color 'black'
    price_in_cents 10000
  end

end