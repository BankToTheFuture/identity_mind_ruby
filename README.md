# IdentityMind

This gem is simple wrapper on Identity Mind API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'identity_mind'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install identity_mind
## Configuration

In order to make calls to the api you must provide credentials:

```ruby
IdentityMind.configure do |config|
  config.user     = ENV['IDENTITY_MIND_USER']
  config.password = ENV['IDENTITY_MIND_PASSWORD']
  config.base_uri = ENV['IDENTITY_MIND_URL'] # default: https://edna.identitymind.com
end
```

## Usage

```ruby
IdentityMind::Account::Merchant.create(merchant: 'params')
IdentityMind::Account::Merchant.fetch(transaction_id)

IdentityMind.get('account/metchant/:transaction_id')

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/identity_mind.
