require "http/client"
require "json"
require "habitat"

require "./monzo/client"

require "./monzo/api/accounts"
require "./monzo/api/balance"

require "./monzo/models/account"
require "./monzo/models/balance"
require "./monzo/models/owner"
require "./monzo/models/payment_details"
require "./monzo/models/locales/us"

# TODO: Write documentation for `Monzo.cr`
module Monzo
  VERSION = "0.1.0"
end
