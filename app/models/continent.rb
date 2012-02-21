class Continent < ActiveRecord::Base
  has_many :locations
  has_many :trips

def to_s
 name
end

end
