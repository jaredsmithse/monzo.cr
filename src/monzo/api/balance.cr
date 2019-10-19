module Monzo
  module API
    class Balance
      delegate :host, :headers, to: Monzo::Client

      def initialize
        @base_url = "#{host}/balance"
      end

      def find(account_id)
        params = HTTP::Params.encode({ "account_id" => account_id })
        url = "#{@base_url}?#{params}"
        response = HTTP::Client.get(url, headers: headers)

        ::Balance.from_json(response.body)
      end
    end
  end
end
