require 'prime'

class Similar < ActiveRecord::Base
  NUM_IN_SET = 24

  def primes
    @primes ||= Prime.take((NUM_IN_SET + 1) * 2).each_slice(NUM_IN_SET).to_a
  end

  def pivot
    @pivot ||= primes[0][-1] + 1
  end

  def is_bidirectional?
    factors.length == 3
  end

  def listing
    if rank_raw > pivot || is_bidirectional?
      Listing.find(listing_id)
    else
      Listing.find(similar_id)
    end
  end

  def similar
    if rank_raw > pivot || is_bidirectional?
      Listing.find(similar_id)
    else
      Listing.find(listing_id)
    end
  end

  def rank
    if is_bidirectional?
      if similar_id < listing_id
        primes[0].index(factors[1])
      else
        primes[1].index(factors[2])
      end
    else
      if rank_raw < pivot
        primes[0].index(rank_raw)
      else
        primes[1].index(rank_raw)
      end
    end
  end

  def factors
    rank_raw.prime_division.flatten.sort.uniq
  end

  def inspect
    to_s
  end

  def to_s
    "#<Similar id:#{id} listing_id:#{listing_id} similar_id:#{similar_id} rank_raw:#{rank_raw} factors:#{factors}>"
  end
end
