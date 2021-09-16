require './lib/UrgentCare/CLI.rb'
require 'stringio'

#use test doubles so internet conn not necessary 
#double - simple object with preprogrammed expectations and responses as preparation for calls it will receive
#stub - an instruction to an object to return a specific response to a method call 

RSpec.describe Urgentcare::CLI do 

	let!(:cliInstance) {Urgentcare::CLI.new}
	subject {Urgentcare::CLI.new}

    it "calls the welcome method" do
     expect(cliInstance).to receive(:welcome).once
     cliInstance.call
    end

    it "prints a welcome message" do 
     allow(cliInstance).to receive(:office_list).and_return("An office list")
     expect(cliInstance).to receive(:office_list).once 
     expect { cliInstance.welcome }.to output(" \n \nWelcome to the Urgent Care CLI\n \n \n \n").to_stdout 
    end

    it "displays message if user exits" do 
     allow(cliInstance).to receive(:office_details).and_return("Office Details")
     allow(cliInstance.list).to receive(:location).and_return("exit")
    	binding.pry 
     expect { cliInstance.list }.to output("Thank you and Goodbye!").to_stdout
    end

    it "displays office details when valid office selected" do
    	
    end
end

