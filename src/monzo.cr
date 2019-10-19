require "http/client"
require "json"
require "habitat"

require "./monzo/client"

require "./monzo/api/accounts"
require "./monzo/api/balance"
require "./monzo/api/webhooks"
require "./monzo/api/whoami"

require "./monzo/models/account"
require "./monzo/models/balance"
require "./monzo/models/locales/us"
require "./monzo/models/owner"
require "./monzo/models/payment_details"
require "./monzo/models/webhook"
require "./monzo/models/whoami"

# TODO: Write documentation for `Monzo.cr`
module Monzo
  VERSION = "0.1.0"
end
