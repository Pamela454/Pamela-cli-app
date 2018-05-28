class Urgentcare::Scraper
require 'nokogiri'
require 'pry'
require 'open-uri' #to work with live website

  # def initialize
  #  @url = url
  #end

  def get_page #page that lists clinics in Boston and surrounding area
    @doc = Nokogiri::HTML(open("https://www.carewellurgentcare.com/locations/"))
  end

  def get_clinics
      url_array = []
      digits_array = []
    self.get_page.css('.et_pb_column_1_4').each_with_index do |location, index|
      if index % 2 == 1 then
        url_array.push(location)
      else
        digits_array.push(location)
      end
    end
    digits_array.zip(url_array).each do |office_details|
      make_office(office_details)
    end
  end

  def make_office(office_details)
      office = Urgentcare::Office.new
      office.name = office_details[0].css('strong').text.strip.gsub("\n", " ").gsub("Next Available:", ", ").gsub(" MA, ", " ").gsub(" MA ,", " ").gsub(" RI, ", ", ").split(",")
      office.url = office_details[1].css('a')[1]["href"]
      office.phone_number = office_details[0].css('a[href]').text
        doc_d = Nokogiri::HTML(open("https://www.carewellurgentcare.com#{office.url}"))
        doc_i = doc_d.css('.locat').attr("src").text
        doc_n = Nokogiri::HTML(open("#{doc_i}"))
      office.next_available = doc_n.css(".panel-heading").text.strip.gsub("\r\n", " ").split(",")[0];
      binding.pry
  end

  def location_list
    get_page.css('.et_pb_column_1_4').css('strong').text.strip.gsub("\n", " ").gsub("Next Available:", ", ").gsub(" MA, ", " ").gsub(" MA ,", " ").gsub(" RI, ", ", ").split(",")
  end
end
