xml.instruct!
xml.brokers() {
  @venues.each_with_index {|venue,i|
    xml.broker do
      xml.Id venue.id
    end
  }
}