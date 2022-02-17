require './lib/UrgentCare/Office.rb'
require 'deep-cover'

RSpec.describe Urgentcare::Office do

	let!(:office){Urgentcare::Office.new}

	it "allows reading and writing for :name" do 
		office.name = 'Test'
		expect(office.name).to eq('Test') 
	end

	it "allows reading and writing for :phone_number" do 
		office.phone_number = '1234567'
		expect(office.phone_number).to eq('1234567') 
	end

	it "allows reading and writing for :next_available" do 
		office.next_available = 'Test'
		expect(office.next_available).to eq('Test') 
	end

	it "allows reading and writing for :url" do 
		office.url = 'Test'
		expect(office.url).to eq('Test') 
	end

	describe '.all' do 
		it "keeps track of all offices" do
			Urgentcare::Office.new(name = "Test")
			expect(Urgentcare::Office.all.last.name).to eq(@name="Test")
		end	
	end

end 