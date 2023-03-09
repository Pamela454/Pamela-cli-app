# UrgentCare

*This developer is currently seeking a job. Please reach out to pamela@torres-rocca.com if interested*

CLI Urgent Care is a Command Line Interface application that returns current wait times at Carewell Urgent Care centers for towns in Massachusetts. COVID-19 testing is available at appointments at all locations. Urgent care is usually needed quickly but not serious enough to require an emergency room visit. This uses the Nokogiri and Watir gems to scrape data from the website. 

## Prerequisites

This application requires the following:
  Ruby 2.5.6 or later


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'UrgentcareCLI', '~> 0.2.5'
```

And then execute:

    $ gem install UrgentcareCLI
    
## Usage

<img width="649" alt="Screen Shot 2022-02-24 at 10 18 50 AM" src="https://user-images.githubusercontent.com/11492782/155553587-82ace535-29ab-4391-9e92-33da62496e3a.png">


TODO: Run bundle exec Urgentcare to start the application. Enter a town number from the menu in the terminal to see more detailed information about that location. The detailed information gives the name, phone number, address, and earliest available appointment time at that location. 

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Pamela454/Pamela-cli-app. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Contributers 
Thanks to the following who have contributed:
  Hernando Torres-Rocca

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Project project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/project/blob/master/CODE_OF_CONDUCT.md).
