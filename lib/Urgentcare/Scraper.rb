class Urgentcare::Scraper

  @@browser = Watir::Browser.new :chrome, headless: true 
  @@clinic_page = @@browser.goto('https://www.carewellurgentcare.com/centers/')

  def get_page # page that lists clinics in Boston and surrounding area
    #@@clinic_page
    doc = @@browser.div(id: 'et-main-area').wait_until(&:present?)
    inner = Nokogiri::HTML(doc.inner_html)
  end

  def get_clinics
    new_page = get_page.css('.centers-list')
    new_page.each_with_index do |office_details, index|
        make_office(office_details, index)
    end
  end
    
  def get_waittime #retrieve waittime and add to new office model 
    #@@clinic_page
    @@clinic_page
    js_doc = @@browser.div(id: 'page-container').wait_until(&:present?) 
    inner = Nokogiri::HTML(js_doc.inner_html)
  end

  def make_office(office_details, index)
    office = Urgentcare::Office.new
    office.name = office_details.css('h2').text
    office.url = office_details.css('a')[2]['href']
    office.phone_number = office_details.css('a[href]').text.delete "Book Telemed AppointmentSchedule AppointmentGet Directions"
    office.next_available = get_waittime.css('strong')[index].text
  end
end
