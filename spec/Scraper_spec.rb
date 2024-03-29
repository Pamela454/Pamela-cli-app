require './lib/UrgentCare/Scraper.rb'
#require 'deep-cover'

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

  it 'gets current appointment time' do
    allow(scraper).to receive(:get_appttime).and_return("@js_doc")
    scraper.get_appttime 
  end

  #it 'creates a new office object' do 
    #allow(scraper).to receive(:make_office).and_return("@off.name")
    #scraper.office_url
  #end

end
