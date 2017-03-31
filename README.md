# ShadowfaxApi

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/shadowfax_api`. To experiment with that code, run `bin/console` for an interactive prompt.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'shadowfax_api'
```

And then execute:
```ruby
    bundle
```

Or install it yourself as:

```ruby
    gem install shadowfax_api
```

**Add shadowfax.yml in config file as**
    
```ruby
    environment_name:
      url: given_url
      key: given_key
```

**If you want to specific config file then you can use this method for initializing the configuration
```ruby
    ShadowfaxApi::Configuration::Config.load("config/shadowfax.yml",env: Rails.env)
```


## Usage



Get Serviceable Pincodes
```ruby
    ShadowfaxApi.get_servicable_pincodes
````

Get Response if particular pincode is serviceable
```ruby
    ShadowfaxApi.check_serviceable_pincode
```
Generate Package
```ruby
    ShadowfaxApi.create_package(package_data)
```

Get Package Details
```ruby
    ShadowfaxApi.get_delivery_details(awb_number)
```

Get Bulk Package Details
```ruby
    ShadowfaxApi.get_bulk_query(awb_data)
```

Cancel Delivery Request
```ruby
    ShadowfaxApi.cancel_delivery_request(data)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Tabish06/shadowfax_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

