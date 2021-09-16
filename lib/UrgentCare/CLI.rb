require_relative "./Office"
require_relative "./Scraper"

class Urgentcare::CLI
#dependency injection to make code more testable
#remove strict dependency on other classes 

  def initialize(scraper: Urgentcare::Scraper.new, offices: Urgentcare::Office.all)
    @scraper = scraper
    @offices = offices
  end

  def call
    welcome
  end

  def welcome()
    #puts displays with a new line 
    puts " "
    puts " "
    puts "Welcome to the Urgent Care CLI"
    puts " "
    puts " "
    puts " "
    office_list 
  end

  def office_list
    @scraper.get_office_list
    puts "Please choose a number from the following list for details on
    an Urgent Care location."
    @offices.each_with_index do |office, i|
      puts "#{i + 1}. #{office.name}"
    end
    list
  end

  def user_input
    gets.chomp
  end

  def list()
    puts " "
    location = user_input
    if location == "Exit" ||location == "exit"
      puts "Thank you and Goodbye!"
    elsif
      @index = location.to_i - 1
      office_details
    else 
       puts "Invalid response"
    end
  end

  def office_details()
    if @index != "Exit" ||@index != "exit"
      puts " "
      puts "---"
      puts "Office Name: #{@offices[@index].name}"
      puts "Office Number: #{@offices[@index].phone_number}"
      puts "Office URL: #{@offices[@index].url}"
      puts "Office Next Available Appointment: #{@offices[@index].next_available}"
      puts "---"
      puts " "

    else
      puts "No results found. Please try again."
    end
      puts "Would you like to select another office from the list?"
      puts " "
      @offices.each_with_index do |office, i|
        puts "#{i + 1}. #{office.name}"
      end
      puts " "
      puts "If not, please type exit."
      puts " "
      list
  end

end
