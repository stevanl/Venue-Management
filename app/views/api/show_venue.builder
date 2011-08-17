xml.instruct!
xml.venue() {
  xml.id @venue.id
  xml.name @venue.name
  xml.city @venue.city
  xml.county @venue.county
  xml.telephone @venue.telephone
  xml.fax @venue.fax
  xml.website @venue.website
  xml.delegate_rates @venue.delegate_rates
  xml.room_hire_rates @venue.room_hire_rates
  xml.meeting_capacity @venue.meeting_capacity
  xml.catering_capacity @venue.catering_capacity
  xml.no_bedrooms @venue.no_bedrooms
  xml.disabled_access @venue.disabled_access
}