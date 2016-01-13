class Listing < ActiveRecord::Base
  def save_similar_listings
    ids = Airbnb.similar_listings(id)

    sql = %{
      SELECT unnest(array[#{ids.join(", ")}]) EXCEPT select id from listings;
    }
    ids_to_get = ActiveRecord::Base.connection.execute(sql).flat_map(&:values)
    ids_to_get.map{ |x| ImportListingJob.perform_later x }
  end

  def to_s
    "#<Listing:#{id} name:#{name[0..10]}... in:#{smart_location}>"
  end
end
