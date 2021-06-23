class Urgentcare::Scraper

  #def self.logInfo(message)
    #output = "%s %s" %  [message, Time.now.strftime("%T")]
    #puts output
  #end 

  def self.send_cmd(driver, cmd, params={})  #method by Hernando Torres- Rocca
    bridge = driver.send(:bridge)
    resource = "session/#{bridge.session_id}/chromium/send_command_and_get_result"
    response = bridge.http.call(:post, resource, {'cmd':cmd, 'params': params})
    raise response[:value] if response[:status]
    return response[:value]
  end

  #logInfo("location 1")
  #Selenium::WebDriver.logger.level = :debug

  @@client = Selenium::WebDriver::Remote::Http::Default.new
  #logInfo("location 2")
  @@client.read_timeout = 3000 # seconds – default is 60
  #logInfo("location 3")

  @@browser = Watir::Browser.new :chrome, headless: true, http_client: @@client
  #logInfo("location 4")
#decrease loading page time 
  send_cmd(@@browser.driver, "Network.setBlockedURLs", {'urls': ["*careuc.netmng.com*"]}) #url pending when page loads
  send_cmd(@@browser.driver, "Network.enable")     
  #logInfo("location 4a")


  @@clinic_page = @@browser.goto('https://www.carewellurgentcare.com/centers/')
  #logInfo("location 5")

  def get_page # page that lists clinics in Boston and surrounding area
    #self.class.logInfo("getPage")
    #@@clinic_page
    doc = @@browser.div(id: 'et-main-area').wait_until(&:present?)
    inner = Nokogiri::HTML(doc.inner_html)
  end

  def get_clinics #called first in CLI
    #self.class.logInfo("get clinics")
    new_page = get_page.css('.centers-list')
    new_page.each_with_index do |office_details, index|
        #self.class.logInfo("new page loop")
        make_office(office_details, index)
        url = office_details.css('a')[2]['href']
        get_waittime(url)
    end
  end
    
  def get_waittime(url) #retrieve waittime and add to new office model 
    self.class.logInfo("get waittime")

#    @@clinic_page
#    @@new_browser = Watir::Browser.new :chrome, headless: false, http_client: @@client
    @@new_browser = @@browser
    @@town_page = @@new_browser.goto(url)
    js_doc = @@new_browser.div(id: 'left-area').iframe.wait_until(&:present?)
    @wait_time = js_doc.button(data_id: "timeSelector").text.gsub("\n", " ")
    Urgentcare::Office.all[0].next_available = @wait_time
    #@@town_page.wait_until(timeout: 50) { @@town_page.iframe.exists? }
    #js_doc = @@new_browser.div(class: 'container').wait_until(&:present?)
    #time = Nokogiri::HTML(js_doc.inner_html)
    #@@browser.div(id: 'reservationForm').wait_until(&:present?)
  end

  def make_office(office_details, index)
    #self.class.logInfo("make office")

    office = Urgentcare::Office.new
    office.name = office_details.css('h2').text
    office.url = office_details.css('a')[2][name="href"]
    office.phone_number = office_details.css('a[href]').text.gsub("Get DirectionsBook Urgent Care AppointmentBook COVID-19 TestBook Telemed Appointment", " ")
    office.next_available = @wait_time 
  end
end
