class Urgentcare::Office  

  attr_accessor :name, :phone_number, :next_available, :url

  @@all = []

  def initialize(name = nil, url = nil, next_available = nil, phone_number = nil)
    @name = name
    @url = url
    @next_available = next_available
    @phone_number = phone_number
    self.class.all << self #the class of this instance. abstracted away use of variable. 
  end

  def self.all
    @@all
  end

  def self.clear
    self.class.all.clear #abstract away use of variable 
  end

end
