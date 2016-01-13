class ImportListingJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    id = args.shift

    json = Airbnb.listing id rescue return false

    keys_we_need = %w(city country name smart_location address zipcode id)
    Listing.create(json.slice(*keys_we_need)) rescue true
  end
end
