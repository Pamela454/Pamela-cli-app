class Urgentcare::Scraper
require 'nokogiri'
require 'pry'
require 'open-uri' #to work with live website


  def first_page #clinics in Boston and surrounding area
    @doc = Nokogiri::HTML(open("https://www.carewellurgentcare.com/locations/"))
  end

  def office_list #converts string to array
    #office_locations_array = [] #array of locations

    @list = first_page.css('.et_pb_code_inner').css('strong').text.gsub("\n", " ").gsub("Next Available:", ", ").gsub(" MA, ", " ").gsub(" MA ,", " ").gsub(" RI, ", ", ").split(",")
    #returns a list of locations in an array
    @list
  end

  def office_url
    @office_url_array = []

    #scrape url, add to an array
      @office_url_array << "https://www.carewellurgentcare.com#{first_page.css('.et_pb_code_inner').css('a')[2]["href"]}"
      @office_url_array << "https://www.carewellurgentcare.com#{first_page.css('.et_pb_code_inner').css('a')[5]["href"]}"
      @office_url_array << "https://www.carewellurgentcare.com#{first_page.css('.et_pb_code_inner').css('a')[8]["href"]}"
      @office_url_array << "https://www.carewellurgentcare.com#{first_page.css('.et_pb_code_inner').css('a')[11]["href"]}"
      @office_url_array << "https://www.carewellurgentcare.com#{first_page.css('.et_pb_code_inner').css('a')[14]["href"]}"
      @office_url_array << "https://www.carewellurgentcare.com#{first_page.css('.et_pb_code_inner').css('a')[17]["href"]}"
      @office_url_array << "https://www.carewellurgentcare.com#{first_page.css('.et_pb_code_inner').css('a')[20]["href"]}"
      @office_url_array << "https://www.carewellurgentcare.com#{first_page.css('.et_pb_code_inner').css('a')[23]["href"]}"
      @office_url_array << "https://www.carewellurgentcare.com#{first_page.css('.et_pb_code_inner').css('a')[26]["href"]}"
      @office_url_array << "https://www.carewellurgentcare.com#{first_page.css('.et_pb_code_inner').css('a')[29]["href"]}"
      @office_url_array << "https://www.carewellurgentcare.com#{first_page.css('.et_pb_code_inner').css('a')[32]["href"]}"
      @office_url_array << "https://www.carewellurgentcare.com#{first_page.css('.et_pb_code_inner').css('a')[35]["href"]}"
      @office_url_array << "https://www.carewellurgentcare.com#{first_page.css('.et_pb_code_inner').css('a')[38]["href"]}"
      @office_url_array << "https://www.carewellurgentcare.com#{first_page.css('.et_pb_code_inner').css('a')[41]["href"]}"
      @office_url_array << "https://www.carewellurgentcare.com#{first_page.css('.et_pb_code_inner').css('a')[44]["href"]}"
      @office_url_array << "https://www.carewellurgentcare.com#{first_page.css('.et_pb_code_inner').css('a')[47]["href"]}"
      @office_url_array << "https://www.carewellurgentcare.com#{first_page.css('.et_pb_code_inner').css('a')[50]["href"]}"

    @office_url_array
  end


end
