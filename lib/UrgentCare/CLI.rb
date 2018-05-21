#CLI controller
class Urgentcare::CLI   #module UrgentCare, class CLI

  def call
    welcome
  end

  def welcome

    puts "Welcome to the Urgent Care CLI"

    puts "Please chose a location from the following list for Urgentcare."

    new_list = Urgentcare::Scraper.new.office_list

    puts new_list

    list

  end

  def list
    location = gets.chomp

    if location == "BILLERICA"
      puts "scraped results from Boston area"
    elsif location == "CAMBRIDGE FRESH POND"
      puts "scraped results from Cape Cod area"
    elsif location == "CAMBRIDGE INMAN"
      puts "scraped results from Southeast MA area"
    elsif location == "FITCHBURG"
      puts ""
    elsif location == "FRAMINGHAM"
      puts ""
    elsif location == "LEXINGTON"
      puts ""
    elsif location == "MARLBOROUGH"
      puts ""
    elsif location == "NEEDHAM"
      puts ""
    elsif location == "NORTHBOROUGH"
      puts ""
    elsif location == "NORWELL"
      puts ""
    elsif location == "PEABODY"
      puts ""
    elsif location == "SOMERVILLE"
      puts ""
    elsif location == "SOUTH DENNIS"
      puts ""
    elsif location == "TEWKSBURY"
      puts ""
    elsif location == "WORCESTER GREENWOOD"
      puts ""
    elsif location == "WORCESTER LINCOLN"
      puts ""
    elsif location == "WARWICK"
      puts ""
    else
      puts "No results found. Please try again."
    end
      puts "Would you like additional info on a specific office?"

      office_details
  end

  def office_details

    office = gets.chomp
    if office == "specific office"
      puts "scraped address"
      puts "scraped phone number"
      puts "scraped appointment link"
    elsif office == "other specific office"
      puts "scraped address"
      puts "scraped phone number"
      puts "scraped appointment link"
    else
      puts "No results found. Please try again."
    end
      puts "Enter exit to leave program."

      input = gets.chomp

      if office == "Exit" || "exit"
        puts "Thank you and Goodbye!"
      else
        office_details
      end
  end

end
