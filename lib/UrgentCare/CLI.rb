#CLI controller
class Urgentcare::CLI   #module UrgentCare, class CLI

  def call
    welcome
  end

  def welcome

    puts "Welcome to the Urgent Care CLI"

    puts "Please enter the location where you need Urgent Care."

    puts "Boston, Cape Cod, or Southeast MA?"

    list
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
