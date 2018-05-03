class Urgentcare::Scraper
require 'nokogiri'
require 'pry'
require 'open-uri'

  def first_page #clinics in Boston and surrounding area
    @doc = Nokogiri::HTML(open("https://www.carewellurgentcare.com/locations/"))
  end

  def office_list
    first_page.css('.et_pb_code_inner').css("strong").text.gsub("Next Available:", " ").gsub("\n", " ").split(/,/)
  end

  def individual_office
    office_list.each do |o|
      Urgentcare::Office.new(o)
    end
  end

end
