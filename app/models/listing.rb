class Listing < ActiveRecord::Base
  def to_s
    "#<Listing:#{id} name:#{name[0..10]}... in:#{smart_location}>"
  end
end
