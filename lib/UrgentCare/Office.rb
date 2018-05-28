class Urgentcare::Office  #class to collect
  require 'nokogiri'
  require 'open-uri'
  require 'pry'

  attr_accessor :name, :phone_number, :next_available, :url

  @@all = []

  def initialize(name = nil, url = nil, next_available = nil, phone_number = nil)
    @name = name
    @url = url
    @next_available = next_available
    @phone_number = phone_number
    @@all << self
  end

  def self.all
    @@all
  end

  def self.clear
    @@all.clear
  end

end
