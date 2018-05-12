class Urgentcare::Scraper
require 'nokogiri'
require 'pry'
require 'open-uri' #to work with live website



  def first_page #clinics in Boston and surrounding area
    doc = Nokogiri::HTML(open("https://www.carewellurgentcare.com/locations/"))
  end

  def office_list #converts string to array
    office_locations_array = [] #array of locations

    list = first_page.css('.et_pb_code_inner').css('strong').text.gsub("\n", " ").gsub("Next Available:", ", ").gsub(" MA, ", " ").gsub(" MA ,", " ").gsub(" RI, ", ", ").split(",")
    #returns a list of locations in an array
    list
      end
    list
  end

  def office_url  #maybe office scraper
    office_url_array = []

    #scrape url, add to an array
office_url_array << first_page.css('.et_pb_code_inner').css('a')[2]["href"]
office_url_array << first_page.css('.et_pb_code_inner').css('a')[5]["href"]
office_url_array << first_page.css('.et_pb_code_inner').css('a')[8]["href"]
office_url_array << first_page.css('.et_pb_code_inner').css('a')[11]["href"]
office_url_array << first_page.css('.et_pb_code_inner').css('a')[14]["href"]
office_url_array << first_page.css('.et_pb_code_inner').css('a')[17]["href"]
office_url_array << first_page.css('.et_pb_code_inner').css('a')[20]["href"]
office_url_array << first_page.css('.et_pb_code_inner').css('a')[23]["href"]
office_url_array << first_page.css('.et_pb_code_inner').css('a')[26]["href"]
office_url_array << first_page.css('.et_pb_code_inner').css('a')[29]["href"]
office_url_array << first_page.css('.et_pb_code_inner').css('a')[32]["href"]
office_url_array << first_page.css('.et_pb_code_inner').css('a')[35]["href"]
office_url_array << first_page.css('.et_pb_code_inner').css('a')[38]["href"]
office_url_array << first_page.css('.et_pb_code_inner').css('a')[41]["href"]
office_url_array << first_page.css('.et_pb_code_inner').css('a')[44]["href"]
office_url_array << first_page.css('.et_pb_code_inner').css('a')[47]["href"]
office_url_array << first_page.css('.et_pb_code_inner').css('a')[50]["href"]

  end

  def phone_number
      #scrape phone number
      first_page.css('p').text.scan(/([0-9]{3}).([0-9]{3}).([0-9]{4})/)  #returns an array of phone numbers
  end

  def next_available(office_url)
      #scrape next available using iframe, returns an array
      parsed_doc = Nokogiri::HTML(open("https://apps.erexpress.com/erx-reservationform/home/index/11242?cid=CWFall2016"))
      office_times = parsed_doc.css(".panel-heading").text.gsub("\r\n", " ").split(",")
      wait_time = office_times[0]
  end

  def individual_office(name, url) #iterates over array and creates new offices and passes in name and url
      Urgentcare::Office.new(name, url)
  end

end
