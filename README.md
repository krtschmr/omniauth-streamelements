# Omniauth::Streamelements

An Omniauth strategy for Streamelements

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-streamelements', github: "krtschmr/omniauth-streamelements"
```

And then execute:

    $ bundle

## Usage

Here's an example for adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :streamelements, ENV["STREAMELEMENTS_CLIENT_ID"], ENV["STREAMELEMENTS_CLIENT_SECRET"]
end
```

## Auth Hash

Here's an example *Auth Hash* available in `request.env['omniauth.auth']`:

```ruby
{"provider"=>"streamelements",
 "uid"=>"5d2....",
 "info"=>{"display_name"=>"MyHero", "name"=>"MyHero"},
 "credentials"=>{"token"=>"CvsQp....", "refresh_token"=>"e8N...", "expires_at"=>1578133337, "expires"=>true},
 "extra"=>
  {"raw_info"=>
    {"streamelements"=>
      {"profile"=>{"headerImage"=>"....", "title"=>"...'s profile"},
       "provider"=>"twitch",
       "broadcasterType"=>"affiliate",
       "suspended"=>false,
       "providerId"=>"1337",
       ...       
       "geo"=>"TH",
       "id"=>"5d29bb4406f75d15ac92a9c3"}}}}

```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/krtschmr/omniauth-streamelements. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
