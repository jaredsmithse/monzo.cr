# monzo.cr

[![Build Status](https://travis-ci.org/jaredsmithse/monzo.cr.svg?branch=master)](https://travis-ci.org/jaredsmithse/monzo.cr)
[![GitHub license](https://img.shields.io/github/license/c910335/mass-spec.svg)](https://github.com/c910335/mass-spec/blob/master/LICENSE)
[![GitHub release](https://img.shields.io/github/release/jaredsmithse/monzo.svg)](https://github.com/jaredsmithse/monzo/releases)

The Monzo API is designed to be a predictable and intuitive interface for interacting with users’ accounts.
This is an API wrapper client for Monzo. It is still under construction and all help is welcome!

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     monzo.cr:
       github: jaredsmithse/monzo.cr
   ```

2. Run `shards install`

## Usage

#### Configuration
Instructions for obtaining your own API token can be found on the Monzo documentation website [here](https://docs.monzo.com/#authentication).
```crystal
require "monzo"

Monzo::Client.configure do |settings|
  settings.access_token = monzo_access_token
  settings.base_url = "https://api.monzo.com"
end
client = Monzo::Client
```

#### Getting All Accounts Belonging To You
```crystal
client = Monzo::Client
accounts = client.budgets.get_all.each do |budget|
  puts account.name
end
```

## Development

For development, you will need a personal access token from Monzo. You can find instructions on how to acquire one for your account [here](https://docs.monzo.com/#authentication).

## Contributing

1. Fork it (<https://github.com/jaredsmithse/monzo.cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [@jaredsmithse](https://github.com/jaredsmithse) Jared Smith - creator, maintainer
