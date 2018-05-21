class Urgentcare::Office  #class to collect
  require 'nokogiri'
  require 'open-uri'
  require 'pry'

  attr_accessor :name, :phone_number, :next_available, :url

  def initialize(name, url)
    @name = name
    @url = url
    @all << self
  end

  def self.all
    #include array for each office company
    @@all 
  end

  def doc
    @doc = Nokogiri::HTML(open(self.url))   #self.url
  end


end
