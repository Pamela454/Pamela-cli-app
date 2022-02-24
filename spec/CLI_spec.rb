require './lib/UrgentCare/CLI.rb'
require 'stringio'
#require 'deep-cover'

#use test doubles so internet conn not necessary 
#double - simple object with preprogrammed expectations and responses as preparation for calls it will receive
#stub - an instruction to an object to return a specific response to a method call 

RSpec.describe Urgentcare::CLI do 

	let!(:cliInstance) {Urgentcare::CLI.new}
	let!(:office) {Urgentcare::Office}

	before(:each) do
      $index = 0
      @new_array = []  
      @offices = @new_array << office.new("Worcester Greenwood St", "https://www.carewellurgentcare.com/urgent-care-appointment-form-worcester-greenwood/", "2:00 PM Friday, September 17 (EDT)  ", "(617) 804-6293 ")
    end

    it "calls the welcome method" do
     expect(cliInstance).to receive(:welcome).once
     cliInstance.call
    end

    it "prints a welcome message" do 
     allow(cliInstance).to receive(:office_list).and_return("An office list")
     expect(cliInstance).to receive(:office_list).once 
     expect { cliInstance.welcome }.to output(" \n \nWelcome to the Urgent Care CLI\n \n \n \n \nRetrieving data....\nLoading......\n.............\n \n").to_stdout 
    end

    it "displays message if user exits" do 
     allow(cliInstance).to receive(:office_details).and_return("Office Details")
     allow(cliInstance).to receive(:user_input).and_return("exit")
     expect { cliInstance.list }.to output(" \nThank you and Goodbye!\n").to_stdout
    end

    it "displays office details when valid office selected" do
      allow(cliInstance).to receive(:list).and_return("List")
      cliInstance.instance_variable_set(:@index, 0)
      expect { cliInstance.office_details }.to output(a_string_starting_with(" \n \n \n---\nOffice Name: Worcester Greenwood St\nOffice Number: (617) 804-6293 \nOffice URL: https://www.carewellurgentcare.com/urgent-care-appointment-form-worcester-greenwood/\nOffice Next Available Appointment: 2:00 PM Friday, September 17 (EDT)")).to_stdout
    end
end

