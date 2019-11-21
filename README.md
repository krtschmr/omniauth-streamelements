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
{
  provider: 'streamelements',
  uid: 12345678,
  info: {
    display_name: 'johndoe',
    name: 'JohnDoe',
  },
  credentials: {
    token: 'asdfghjklasdfghjklasdfghjkl', # OAuth 2.0 access_token, which you may wish to store
    expires: false # this will always be false
  },
  extra: {
    raw_info: {
      twitch: {
        display_name: 'johndoe',
        name: 'JohnDoe',
        _id: 12345678,
      },
    }
  }
}
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/krtschmr/omniauth-streamelements. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
