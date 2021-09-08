require './lib/UrgentCare/CLI.rb'

RSpec.describe Urgentcare::CLI do 

    it "calls the welcome method" do
     cliInstance = Urgentcare::CLI.new
     expect(cliInstance).to receive(:welcome).once
     cliInstance.call
    end

    it 'displays message if user exits' do 
      cliInstance = Urgentcare::CLI.new
      allow(:cliInstance).to receive(:list)
      allow($stdout).to receive(:puts) #receive input from user 
      expect(:list("exit")).to eq("Thank you and Goodbye!")
    end
end