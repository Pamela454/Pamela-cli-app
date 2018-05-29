#CLI controller
require 'pry'
require "./lib/Urgentcare"
require "./lib/Urgentcare/Scraper"
require "./lib/Urgentcare/Office"

class Urgentcare::CLI   #module UrgentCare, class CLI

  def call
    welcome
  end

  def welcome

    puts "Welcome to the Urgent Care CLI"

    puts "Please choose a location from the following list for Urgentcare."

    @scrape = Urgentcare::Scraper.new
    @scrape.get_clinics
    @clinics = Urgentcare::Office.all
    @clinics.each_with_index do |office, i|
      puts "#{i + 1}. #{office.name}"
    end
    list
  end

  def list
    location = gets.chomp
    index = location.to_i - 1

      the_office = Urgentcare::Office.all
    if index > -1
      puts "#{the_office[index].name}"
      puts "#{the_office[index].phone_number}"
      puts "https://www.www.carewellurgentcare.com#{the_office[index].url}"
    else
      puts "No results found. Please try again."
    end
      puts "Would you like the next available time at a specific office?"
      puts "If so, please select from the list."
      @clinics.each_with_index do |office, i|
        puts "#{i + 1}. #{office.name}"
      end
      office_details
  end

  def office_details

    office = gets.chomp
    index = office.to_i - 1

    specific_office = Urgentcare::Office.all
    if index > -1
      puts "Next Available: #{specific_office[index].next_available}"
    else
      puts "No results found. Please try again."
    end
      puts "Enter exit to leave program."

      input = gets.chomp

      if office == "Exit" ||office == "exit"
        puts "Thank you and Goodbye!"
      else
        office_details
      end
  end
end
