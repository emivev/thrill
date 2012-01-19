class Trip < ActiveRecord::Base
    
belongs_to :user
belongs_to :location
has_and_belongs_to_many :categories 
has_and_belongs_to_many :details 
has_and_belongs_to_many :types 

has_many :accomodations, :dependent => :destroy
has_many :lessons, :dependent => :destroy
has_many :reviews, :dependent => :destroy

 attr_accessible :title, :description, :images_attributes, :price, :url, :location_id, :category_ids, :type_ids, :detail_ids, :accomodations_attributes, :lessons_attributes, :reviews_attributes
 has_many :images
    
 accepts_nested_attributes_for :images, :allow_destroy => true

 accepts_nested_attributes_for :accomodations, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
 
 accepts_nested_attributes_for :lessons, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
 
 accepts_nested_attributes_for :reviews, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true

scope :with_category, lambda { |categories|
    categories.present? ? where(:category_ids => categories) : scoped }
scope :with_location, lambda { |locations|
    locations.present? ? where(:location_id => locations) : scoped }


def to_s
 title
end

def category_names
  categories.map(&:name)
end



def thumb_nail_url
    image = images.first
    image ? image.image.url(:thumb) : nil
end


end
