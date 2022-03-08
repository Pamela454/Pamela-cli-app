class Urgentcare::Scraper

  def initialize(office = Urgentcare::Office, scraper: Urgentcare::Scraper)
    @office = office 
    @scraper = scraper 
  end

  def self.send_cmd(driver, cmd, params={})  #method by Hernando Torres- Rocca
    bridge = driver.send(:bridge)
    resource = "session/#{bridge.session_id}/chromium/send_command_and_get_result"
    response = bridge.http.call(:post, resource, {'cmd':cmd, 'params': params})
    raise response[:value] if response[:status]
    return response[:value]
  end

  @@client = Selenium::WebDriver::Remote::Http::Default.new #class variable 
  @@client.read_timeout = 3000 # seconds – default is 60

  @@browser = Watir::Browser.new :chrome, headless: true, http_client: @@client
  send_cmd(@@browser.driver, "Network.setBlockedURLs", {'urls': ["*careuc.netmng.com*"]}) #url pending when page loads
  send_cmd(@@browser.driver, "Network.enable")   

  @@clinic_page = @@browser.goto('https://www.carewellurgentcare.com/centers/')  

  @@url = []

  def get_page # page that lists all clinics 
    doc = @@browser.div(id: 'et-main-area').wait_until(&:present?)
    inner = Nokogiri::HTML(doc.inner_html)  #return value of the method 
  end

  def get_office_list #called first in CLI
    @new_page = get_page.css('.centers-list')
    office_url
  end

  def office_url 
    @new_page.each do |office_details|  #does not create additional objects. returns original object
      @@url << office_details.css('a')[2][name="href"]
      @office_details = office_details
      make_office
    end
  end

  def get_clinic_site 
    @@browser.goto(@@url[$index]) 
    @js_doc = @@browser.iframe.wait_until(&:present?) 
    get_appttime_date
  end

  def make_office
    @off = @office.new 
    @off.name = @office_details.css('h2').text
    @off.url = @office_details.css('a')[2][name="href"]
    @off.phone_number = @office_details.css('a[href]').text.gsub("Get DirectionsBook Urgent Care Appointment", " ")
  end

  def get_appttime_date #retrieve waittime and add to new office model 
    sleep(1);
    iframe_info = Nokogiri::HTML(@js_doc.html) 
    if iframe_info.css('div.time-slots')
      @wait_day = iframe_info.css('div.d-flex.d-md-none.header').text
      @wait_time = iframe_info.css('div.time-slot.selected').text
      @office.all[$index].next_available = "#{@wait_day} #{@wait_time}"
    else   
      @wait_time = "No time available"
      @office.all[$index].next_available = "#{@wait_time}"
    end
  end

end  