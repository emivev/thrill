class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
 before_filter :meta_defaults
 private

 def meta_defaults
    @meta_title = "Thrill Engine | The Adventure Finder | Snowboard/Ski/Surf/Kite Trips | Action Sports Travel Destinations"
    @meta_keywords = "Thrill Engine, thrills, Action Sports Holidays, Extreme Sports Holidays, Action Sports Travel Destinations, Action Sports Travel, Snowboard trips, snowboard vacation, snowboarding travel, snowboarding holidays, chalets, skiing, Big mountains, slopes, rent, booking, surf, surfing, surf vacation, surf travel, surf camp, kitesurf, kitesurfing travel, kitesurfing lessons, kitesurfing holidays, kiteboard, kiteboarding travel, kiteboarding holidays "
    @meta_description = "Find Your Next Surf/Snowboard/Ski/Kiteboard Trip. Browse by Sport or Location. Destinations for Beginners or Advanced Riders Who are Looking for Improvment"
  end
  
  
end
