# UrgentCare

CLI Urgent Care is a Command Line Interface application that returns current wait times at Carewell Urgent Care centers for towns in Massachusetts. Urgent care is usually needed quickly but not serious enough to require an emergency room visit. This uses the Nokogiri and Watir gems to scrape information from the website. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'UrgentcareCLI', '~> 0.1.1'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install UrgentcareCLI

## Usage

TODO: Run ./bin/Urgentcare to start the application. Select a town number from the menu to see more detailed information about that location. The detailed information gives the name, phone number, address, and earliest available appointment time at that location. 

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Pamela454/Pamela-cli-app. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Project project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/project/blob/master/CODE_OF_CONDUCT.md).
