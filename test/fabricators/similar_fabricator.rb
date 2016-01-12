Fabricator(:similar) do
  listing_id { Faker::Address.building_number }
  similar_id { Faker::Address.building_number }
  rank { Prime.take(33).sample }
end
