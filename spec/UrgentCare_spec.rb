require './lib/UrgentCare/Office.rb'
#require 'deep-cover'

#test stubs help with inputs
#mock objects help with outputs 

RSpec.describe Urgentcare do  
  it "has a version number" do
    expect(Urgentcare::VERSION).not_to be nil
  end


  #it "does something useful" do
    #expect(false).to eq(true)
  #end
end

#need to mock instead of actually calling welcome 

 #validate that a new object is saved with appropriate attributes

#scraper - opens webpage
     #make office creates a valid office

#cli - output to console is correct 

#manual, UI, automation 
#integration testing - between different parts of application, use for each application feature
#performance testing - black box testing, stress system, no visibility inside system 
      #load testing - bottlenecks?, monitor how long requests take, 
      #endurance testing - simulate
      #many requests (check for memory leaks) 
      #stress testing - extreme work loads, measure software stability

#security testing - problems in app to behave in unexpected ways, loss of data, website downtime,
#SQL injections (check each field), DOS attack (take down servers/network, coming from bots), dependencies (github alerts)
