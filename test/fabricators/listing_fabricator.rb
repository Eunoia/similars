Fabricator(:listing) do
  id { sequence(:id, 1) }
  city { Faker::Address.city }
  country { 'US' }
  name { Faker::Company.name }
  property_id { sequence(:property_id, 100) }
  address { Faker::Address.street_name }
  zipcode { Faker::Address.zip_code }
end
