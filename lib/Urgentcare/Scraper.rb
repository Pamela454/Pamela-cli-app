class Urgentcare::Scraper

  def get_page # page that lists clinics in Boston and surrounding area
    @doc = Nokogiri::HTML(open('https://www.carewellurgentcare.com/centers/'))
  end

  def get_clinics
    url_array = []
    digits_array = []
    get_page.css('.centers-list').each_with_index do |location, index|
      if index.odd?
        url_array.push(location)
      else
        digits_array.push(location)
      end
    end
    merge_arrays(digits_array, url_array)
  end

  def merge_arrays(digits_array, url_array)
    digits_array[0..16].zip(url_array[0..16]).each_with_index do |office_details, index|
        make_office(office_details)
    end
  end

  def make_office(office_details)
    office = Urgentcare::Office.new
    office.name = office_details[0].css('h2').text
    office.url = office_details[0].css('a')[2]['href']
    office.phone_number = office_details[0].css('a[href]').text.delete "Book Telemed AppointmentSchedule AppointmentGet Directions"
    #doc_d = Nokogiri::HTML(open("https://www.carewellurgentcare.com#{office.url}"))
    #doc_i = doc_d.css('.locat').attr('src').text
    #doc_n = Nokogiri::HTML(open(doc_i.to_s))
    office.next_available = office_details[0].css('strong.FacilityBookNowTime')
    #doc_n.css('.panel-heading').text.strip.gsub("\r\n", ' ').split(',')[0]
  end
end
