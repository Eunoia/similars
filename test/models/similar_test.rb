require "test_helper"

class TestSimilar < Minitest::Test
  def setup
    DatabaseCleaner.start
    Fabricate(:listing) { id { 3 } }
    Fabricate(:listing) { id { 7 } }
  end

  def test_must_return_a_proper_rank_for_low_primes
    assert_equal Similar.new(rank_raw: 29).rank, 9
  end

  def test_must_return_a_proper_rank_for_high_primes
    assert_equal Similar.new(rank_raw: 101).rank, 1
  end

  def test_must_return_a_proper_rank_for_bidirectional_when_ids_hi_to_lo
    similar = Similar.new(listing_id: 7, similar_id: 3, rank_raw: 2507)
    assert_equal similar.rank, 8
  end

  def test_must_return_a_proper_rank_for_bidirectional_when_ids_lo_to_hi
    similar = Similar.new(listing_id: 3, similar_id: 7, rank_raw: 2507)
    assert_equal similar.rank, 4
  end

  def test_listing_handles_order_properly_when_ids_lo_to_hi
    similar = Similar.new(listing_id: 3, similar_id: 7, rank_raw: 2507)
    assert_equal similar.listing.id, 3
    assert_equal similar.similar.id, 7
  end

  def test_listing_handles_order_properly_when_ids_hi_to_lo
    similar = Similar.new(listing_id: 7, similar_id: 3, rank_raw: 2507)
    assert_equal similar.listing.id, 7
    assert_equal similar.similar.id, 3
  end

  def teardown
    DatabaseCleaner.clean
  end
end
