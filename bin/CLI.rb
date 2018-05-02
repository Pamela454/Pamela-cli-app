#!/usr/local/bin/ruby -w
#-w turns on warnings

puts "Welcome to the Urgent Care CLI"

puts "Please enter the location where you need Urgent Care."

puts "Boston, Cape Cod, or Southeast MA?"

location = gets.chomp

if location == "Boston"
  puts "scraped results from Boston area"
elsif location == "Cape Cod"
  puts "scraped results from Cape Cod area"
elsif location == "Southeast MA"
  puts "scraped results from Southeast MA area"
else
  puts "No results found. Please try again."
end

puts "Would you like additional info on a specific office?"

office = gets.chomp
