require './lib/UrgentCare/Scraper.rb'

RSpec.describe Urgentcare::CLI do 

    let!(:scraper) { Urgentcare::Scraper.new }

    before(:each) do
		@doc = Nokogiri::HTML.parse(
    	File.open("./spec/html_site.html"))
    	@get_page = @doc.inner_html
    	@inner_page = Nokogiri::HTML(@get_page)
    	@new_page = @inner_page.css('.centers-list')
    	@clinic_page = Nokogiri::HTML.parse(
    	File.open("./spec/clinic_site.html"))
	end

    #get_page returns nil 
	it 'mocked page returns html from url' do
		expect(@get_page).to start_with("<html")
	end

	it 'get_clinic_site returns html from clinic site' do 
		allow(scraper).to receive(:get_clinic_site).and_return("@js_doc")
		scraper.get_clinic_site(@clinic_page)
	end

	it 'get_office_list returns html list of clinics' do 
		allow(scraper).to receive(:get_appttime).and_return("@new_page")
		scraper.get_office_list
	end

	it 'office_url calls new method with scraped url' do
		allow(scraper).to receive(:get_appttime).and_return("New Time")
		scraper.get_office_list
		expect { scraper.get_appttime(@clinic_page) }.to output("No time available").to_stdout
	end

	it 'gets current appointment time' do
		
	end

	it 'creates a new office object' do 

	end

end
