puts 'Event Manager Initialized!'

# read file
contents = File.read('event_attendees.csv')
puts contents


# line by line 
lines = File.readlines('event_attendees.csv')
lines.each do |line|
  puts line
end