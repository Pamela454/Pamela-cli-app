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

    puts "Please chose a location from the following list for Urgentcare."

    scrape = Urgentcare::Scraper.new

    scrape.location_list

    list
  end

  def list
    location = gets.chomp

    if location == "BILLERICA"
      puts ""
    elsif location == "CAMBRIDGE FRESH POND"
      puts ""
    elsif location == "CAMBRIDGE INMAN"
      puts urls[2]
    elsif location == "FITCHBURG"
      puts urls[3]
    elsif location == "FRAMINGHAM"
      puts urls[4]
    elsif location == "LEXINGTON"
      puts urls[5]
    elsif location == "MARLBOROUGH"
      puts urls[6]
    elsif location == "NEEDHAM"
      puts urls[7]
    elsif location == "NORTHBOROUGH"
      puts urls[8]
    elsif location == "NORWELL"
      puts urls[9]
    elsif location == "PEABODY"
      puts urls[10]
    elsif location == "SOMERVILLE"
      puts urls[11]
    elsif location == "SOUTH DENNIS"
      puts urls[12]
    elsif location == "TEWKSBURY"
      puts urls[13]
    elsif location == "WORCESTER GREENWOOD"
      puts urls[14]
    elsif location == "WORCESTER LINCOLN"
      puts urls[15]
    elsif location == "WARWICK"
      puts urls[16]
    else
      puts "No results found. Please try again."
    end
      puts "Would you like additional info on a specific office?"

      office_details
  end

  def office_details

    office = gets.chomp
    if office == "BILLERICA"
      puts "Phone number: #{Urgentcare::Scraper.new.phone_number[0]}"
      puts "Next Available: #{Urgentcare::Scraper.new.next_available_time[0]}"
    elsif office == "CAMBRIDGE FRESH POND"
      puts "Phone number: #{Urgentcare::Scraper.new.phone_number[1]}"
      puts "Next Available: #{Urgentcare::Scraper.new.next_available_time[1]}"
    elsif office == "CAMBRIDGE INMAN"
      puts "Phone number: #{Urgentcare::Scraper.new.phone_number[2]}"
      puts "Next Available: #{Urgentcare::Scraper.new.next_available_time[2]}"
    elsif office == "FITCHBURG"
      puts "Phone number: #{Urgentcare::Scraper.new.phone_number[3]}"
      puts "Next Available: #{Urgentcare::Scraper.new.next_available_time[3]}"
    elsif office == "FRAMINGHAM"
      puts "Phone number: #{Urgentcare::Scraper.new.phone_number[4]}"
      puts "Next Available: #{Urgentcare::Scraper.new.next_available_time[4]}"
    elsif office == "LEXINGTON"
      puts "Phone number: #{Urgentcare::Scraper.new.phone_number[5]}"
      puts "Next Available: #{Urgentcare::Scraper.new.next_available_time[5]}"
    elsif office == "MARLBOROUGH"
      puts "Phone number: #{Urgentcare::Scraper.new.phone_number[6]}"
      puts "Next Available: #{Urgentcare::Scraper.new.next_available_time[6]}"
    elsif office == "NEEDHAM"
      puts "Phone number: #{Urgentcare::Scraper.new.phone_number[7]}"
      puts "Next Available: #{Urgentcare::Scraper.new.next_available_time[7]}"
    elsif office == "NORTHBOROUGH"
      puts "Phone number: #{Urgentcare::Scraper.new.phone_number[8]}"
      puts "Next Available: #{Urgentcare::Scraper.new.next_available_time[8]}"
    elsif office == "NORWELL"
      puts "Phone number: #{Urgentcare::Scraper.new.phone_number[9]}"
      puts "Next Available: #{Urgentcare::Scraper.new.next_available_time[9]}"
    elsif office == "PEABODY"
      puts "Phone number: #{Urgentcare::Scraper.new.phone_number[10]}"
      puts "Next Available: #{Urgentcare::Scraper.new.next_available_time[10]}"
    elsif office == "SOMERVILLE"
      puts "Phone number: #{Urgentcare::Scraper.new.phone_number[11]}"
      puts "Next Available: #{Urgentcare::Scraper.new.next_available_time[11]}"
    elsif office == "SOUTH DENNIS"
      puts "Phone number: #{Urgentcare::Scraper.new.phone_number[12]}"
      puts "Next Available: #{Urgentcare::Scraper.new.next_available_time[12]}"
    elsif office == "TEWKSBURY"
      puts "Phone number: #{Urgentcare::Scraper.new.phone_number[13]}"
      puts "Next Available: #{Urgentcare::Scraper.new.next_available_time[13]}"
    elsif office == "WORCESTER GREENWOOD"
      puts "Phone number: #{Urgentcare::Scraper.new.phone_number[14]}"
      puts "Next Available: #{Urgentcare::Scraper.new.next_available_time[14]}"
    elsif office == "WORCESTER LINCOLN"
      puts "Phone number: #{Urgentcare::Scraper.new.phone_number[15]}"
      puts "Next Available: #{Urgentcare::Scraper.new.next_available_time[15]}"
    elsif office == "WARWICK"
      puts "Phone number: #{Urgentcare::Scraper.new.phone_number[16]}"
      puts "Next Available: #{Urgentcare::Scraper.new.next_available_time[16]}"
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
