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
     
     expect { cliInstance.welcome }.to output("Welcome to the Urgent Care CLI\n \n \nPlease choose a number from the following list for details on\n    an Urgent Care location.\n  \n").to_stdout 
    end

    #want to receive message that is a response to user entry of exit 
    it 'displays message if user exits' do 
      #expect(:list("exit")).to eq("Thank you and Goodbye!")
    end

end

#check that it retrives list 
#check that it responds to user input
