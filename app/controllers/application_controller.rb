class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
 before_filter :meta_defaults
 private

 def meta_defaults
    @meta_title = "Thrill Engine - Find the Epic Action Holiday: Kiteboarding, Surfing, Snowboarding Worldwide"
    @meta_keywords = "Action Sports Holidays, kiteboarding, kiteboard, Kite Worldwide, kitesurfing destinations, best kiteboarding spots, kitesurfing locations, kitereisen, surfing, snowboarding  "
    @meta_description = "Thrill Engine is all about trips that will make you feel alive. Fair Prices, No Booking Fees."
  end
  
  
end
