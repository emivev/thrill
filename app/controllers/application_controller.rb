class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
 before_filter :meta_defaults
 private

 def meta_defaults
    @meta_title = "Thrill Engine | The Adventure Finder | Snowboard/Ski/Surf/Kite Trips | Action Sports Travel Destinations"
    @meta_keywords = "Thrill Engine, THRILL, Snowboard Camp, Snowboard travel, Snowboard trips, Ski Camps, Ski travel, Ski trips, Summer trips, Winter trips, Winter travel, Snowboard Camps, Surf Travel, Surf trips, Backcountry, surf adventures, action sports travel, adventure travel, mountain guides, Surf Villas, Chalets, Snow Chalets, Adventure search"
    @meta_description = "Travel destinations for the Most Awesome Vacations of Your Life"
  end
  
  
end
