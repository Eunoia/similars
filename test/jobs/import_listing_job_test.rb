require "test_helper"

class TestImportListingJob < Minitest::Test
  def setup
    DatabaseCleaner.start
    VCR.use_cassette('listing', allow_playback_repeats: true) do
      ImportListingJob.perform_later 4693285
    end
    @listing = Listing.find 4693285
  end

  def test_imported_listing_has_correct_title
    assert_equal @listing.name, 'Tranquil Guesthouse Retreat'
  end

  def teardown
    DatabaseCleaner.clean
  end
end
