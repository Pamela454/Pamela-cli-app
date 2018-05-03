#class Urgentcare::Scraper
#!/usr/bin/env ruby
require 'nokogiri'
require 'pry'
require 'open-uri'

  def first_page #clinics in Boston and surrounding area
    @doc = Nokogiri::HTML(open("https://www.carewellurgentcare.com/locations/"))
  end

  def office_list
    first_page.css('.et_pb_code_inner').css("strong").text.gsub("Next Available:", " ").gsub("\n", " ")
  end

  def individual_office

  end

#end
