module Monzo
  module API
    class Accounts
      delegate :host, :headers, to: Monzo::Client

      def initialize
        @base_url = "#{host}/accounts"
      end

      def list
        response = HTTP::Client.get(@base_url, headers: headers)

        Array(Account).from_json(response.body, "accounts")
      end
    end
  end
end
