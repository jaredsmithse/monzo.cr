module Monzo
  module API
    # Accounts represent a store of funds, and have a list of transactions.
    class Accounts
      delegate :host, :headers, to: Monzo::Client

      def initialize
        @base_url = "#{host}/accounts"
      end

      # Returns a list of `Account`s owned by the currently authorised user.
      #
      # To filter by either prepaid or current account, add account_type as a
      # url parameter. Valid `account_type`s are `uk_retail`, `uk_retail_joint`.
      def list
        response = HTTP::Client.get(@base_url, headers: headers)

        Array(Account).from_json(response.body, "accounts")
      end
    end
  end
end
