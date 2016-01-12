class TestAirbnb < Minitest::Test
  def setup
    @meme = Object.new
  end

  def test_that_listing_returns_important_attributes
    VCR.use_cassette('listing') do
      listing = Airbnb.listing('4693285')
      keys_we_need = %w(city country name smart_location address zipcode id)
      values = listing.values_at(*keys_we_need).compact

      assert_equal values.length, 7, 'There is a mismatch of keys'
    end
  end

  def test_that_similar_listings_has_many_listings
    VCR.use_cassette('similar') do
      similar_ids = Airbnb.similar_listings('4693285')
      assert_equal similar_ids.length, 24, 'There is no keys'
    end
  end
end
