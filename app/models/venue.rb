class Venue < ActiveRecord::Base
  set_primary_key :venue_id
  has_many :contact
  has_many :attraction
  has_many :nearby_facility
  has_many :style
  has_many :meeting_room
end
