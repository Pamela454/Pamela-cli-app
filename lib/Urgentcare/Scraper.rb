class Urgentcare::Scraper

  def initialize(office = Urgentcare::Office)
    @office = office 
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

  def get_page # page that lists all clinics 
    doc = @@browser.div(id: 'et-main-area').wait_until(&:present?)
    inner = Nokogiri::HTML(doc.inner_html)  #return value of the method 
  end

  def get_office_list #called first in CLI
    @new_page = get_page.css('.centers-list')
    office_url
  end

  def office_url 
    @new_page.each_with_index do |office_details, index|
        if office_details.css('a').length > 3
          url = office_details.css('a')[3][name="href"]
        else
          url = office_details.css('a')[2][name="href"]
        end
        get_clinic_site(url)
        @off = @office.new 
        make_office(office_details, index) 
    end
  end

  def get_clinic_site(url) 
    @@browser.goto(url) 
    @js_doc = @@browser.iframe.wait_until(&:present?) 
  end

  def get_appttime #retrieve waittime and add to new office model 
    if  @js_doc.button(data_id: "timeSelector").exists? 
      @wait_time = @js_doc.button(data_id: "timeSelector").text.gsub("\n", " ")
    elsif @js_doc.element(tag_name: 'h3').exists?  
      @wait_time = @js_doc.element(tag_name: 'h3').text 
    else
      @wait_time = "No time available"
    end
  end

  def make_office(office_details, index)
      @off.name = office_details.css('h2').text
    if office_details.css('a').length > 3
      @off.url = office_details.css('a')[3][name="href"]
    else
      @off.url = office_details.css('a')[2][name="href"]
    end
    get_appttime
    @off.next_available = @wait_time
    @off.phone_number = office_details.css('a[href]').text.gsub("Get DirectionsBook Urgent Care Appointment", " ")
  end

end  