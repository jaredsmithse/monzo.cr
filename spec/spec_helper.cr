require "spec"
require "yaml"
require "webmock"

require "../src/monzo"

Monzo::Client.configure do |settings|
  settings.access_token = "api_key"
  settings.base_url = "https://api.monzo.com"
end
