class Location < ActiveRecord::Base
has_many :trips
belongs_to :continent

def to_s
 name
end

end
