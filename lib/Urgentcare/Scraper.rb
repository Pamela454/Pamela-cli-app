class Urgentcare::Scraper
require 'nokogiri'
require 'pry'
require 'open-uri'

  def first_page #clinics in Boston and surrounding area
    @doc = Nokogiri::HTML(open("https://www.carewellurgentcare.com/locations/"))
  end

  def office_list #converts string to array
    first_page.css('.et_pb_code_inner').css("strong").text.gsub("Next Available:", " ").gsub("\n", " ").split(/,/)
  end

  def office_url
    nodeset = first_page.css('a[href]')    # Get anchors w href attribute via css
    results = nodeset.map {|element| element["href"]}
    results.select {|item| item.include?("locations")} #place results into an array 
  end

  def individual_office #iterates over array and creates new offices and passes in name and url
    office_list.each do |o|
      Urgentcare::Office.new(o)
    end
  end

end
