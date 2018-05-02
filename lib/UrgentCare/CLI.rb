#!/usr/local/bin/ruby -w
#-w turns on warnings
class UrgentCare::CLI

  def welcome
    puts "Welcome to the Urgent Care CLI"

    puts "Please enter the location where you need Urgent Care."

    puts "Boston, Cape Cod, or Southeast MA?"
  end

  def list
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
  end

  def office_details
    puts "Would you like additional info on a specific office?"

    office = gets.chomp

    if specific office
      puts "scraped address"
      puts "scraped phone number"
      puts "scraped appointment link"
    else
      puts "No results found. Please try again."
  end

end
