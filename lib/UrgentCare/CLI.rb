class Urgentcare::CLI

  def call
    welcome
  end

  def welcome
    #puts displays with a new line 
    puts "Welcome to the Urgent Care CLI"
    puts " "
    puts " "
    puts "Please choose a number from the following list for details on
    an Urgent Care location."
    puts "  "

    Urgentcare::Scraper.new.get_offices 
    @clinics = Urgentcare::Office.all
    @clinics.each_with_index do |office, i|
      puts "#{i + 1}. #{office.name}"
    end
    list
  end

  def list
    puts " "
    location = gets.chomp
    if location == "Exit" ||location == "exit"
      puts "Thank you and Goodbye!"
    else
      @index = location.to_i - 1
      office_details
    end
  end

  def office_details
      the_office = Urgentcare::Office.all
    if @index != "Exit" ||@index != "exit"
      puts " "
      puts "---"
      puts "Office Name: #{the_office[@index].name}"
      puts "Office Number: #{the_office[@index].phone_number}"
      puts "Office URL: #{the_office[@index].url}"
      puts "Office Next Available Appointment: #{the_office[@index].next_available}"
      puts "---"
      puts " "

    else
      puts "No results found. Please try again."
    end
      puts "Would you like to select another office from the list?"
      puts " "
      @clinics.each_with_index do |office, i|
        puts "#{i + 1}. #{office.name}"
      end
      puts " "
      puts "If not, please type exit."
      puts " "
      list
  end
end
