require 'pry'
require 'nokogiri'
require 'open-uri'
require 'watir'
require 'capybara'

require_relative "./Urgentcare/CLI"
require_relative "./Urgentcare/version"  #why was this not a relative path?
require_relative "./Urgentcare/Office"
require_relative "./Urgentcare/Scraper"

#required by bundler
module Urgentcare
  # Your code goes here...
end
