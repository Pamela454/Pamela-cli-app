#class Urgentcare::Scraper
#!/usr/bin/env ruby
require 'nokogiri'
require 'pry'
require 'open-uri'

  def first_page
    @doc = Nokogiri::HTML(open("https://www.carewellurgentcare.com/locations/"))
  end

#end
