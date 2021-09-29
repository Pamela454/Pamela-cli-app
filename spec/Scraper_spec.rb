require './lib/UrgentCare/Scraper.rb'

RSpec.describe Urgentcare::CLI do 

    let!(:scraper) { Urgentcare::Scraper.new }

	htmlfile = Nokogiri::HTML.parse(
    File.open("./spec/html_site.html"))

	it 'gets html from url' do
		
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
