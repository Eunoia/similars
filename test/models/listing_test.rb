require "test_helper"

class TestListing < Minitest::Test
  def setup
    DatabaseCleaner.start
    Fabricate(:listing) { id { 4693285 } }
  end

  def test_finds_similar_listings
    VCR.use_cassette('similar') do
      assert_equal Listing.find(4693285).save_similar_listings.length, 24
    end
  end

  def teardown
    DatabaseCleaner.clean
  end
end
