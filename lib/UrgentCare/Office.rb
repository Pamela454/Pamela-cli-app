class Urgentcare::Office  #class to collect
  require 'nokogiri'
  require 'open-uri'
  require 'pry'

  attr_accessor :name, :phone_number, :next_available, :url

  def initialize(name)
    @name = name
    @phone_number = phone_number
    @next_available = next_available
    @url = url
    @all << self
  end

  def self.all
    #include array for each office company
    @all
  end

  def name #details- scrapes all care well offices for details, conditional assign operator
    @name ||= individual_office
  end

  def next_available
    @next_available ||= doc.css('.carewellBookNowTime')
  end

  def phone_number
    @phone_number ||= doc.css("a")
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end


end
