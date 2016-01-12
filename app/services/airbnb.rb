require 'open-uri'

class Airbnb
  def self.get(url)
    ua  = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.75.14'
    ua += '(KHTML, like Gecko) Version/7.0.3 Safari/7046A194A'
    # puts url
    JSON.parse(open(url, 'User-Agent' => ua).read)
  end

  def self.listing(id)
    url  = "https://www.airbnb.com/api/v1/listings/#{id}"
    url += '?key=d306zoyjsyarp7ifhu67rjxn52tv0t20'
    get(url).try(:[], 'listing')
  end

  def self.similar_listings(id)
    url = "https://www.airbnb.com/rooms/#{id}/similar_listings"
    get(url).try(:[], 'properties').map { |l| l['id'] }
  end
end
