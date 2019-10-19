module Monzo
  module API
    # Retrieve information about an account’s balance.
    class Balance
      delegate :host, :headers, to: Monzo::Client

      def initialize
        @base_url = "#{host}/balance"
      end

      # Returns balance information for a specific account.
      def find(account_id)
        params = HTTP::Params.encode({ "account_id" => account_id })
        url = "#{@base_url}?#{params}"
        response = HTTP::Client.get(url, headers: headers)

        ::Balance.from_json(response.body)
      end
    end
  end
end
