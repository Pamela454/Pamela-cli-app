require './lib/UrgentCare/Scraper.rb'

RSpec.describe Urgentcare::CLI do 

    let!(:scraper) { Urgentcare::Scraper.new }

    before(:each) do
		@doc = Nokogiri::HTML.parse(
    	File.open("./spec/html_site.html"))
    	@get_page = @doc.inner_html
	end

    #get_page returns nil 
	it 'mocked page returns html from url' do
		expect(@get_page).to start_with("<html")
	end

	it 'gets clinic data' do
		
	end

	it 'gets current appointment time' do
		
	end

	it 'creates a new office object' do 

	end

end

#test that nokogiri can get html from fake page 
#test get clinics can get data
#test get waittime can get data  
#test that an office can be made from make_office function using fake html data
