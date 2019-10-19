module Monzo
  module API
    class Webhooks
      delegate :host, :headers, to: Monzo::Client

      def initialize
        @base_url = "#{host}/webhooks"
      end

      def list(account_id)
        params = HTTP::Params.encode({ "account_id" => account_id })
        url = "#{@base_url}?#{params}"
        response = HTTP::Client.get(url, headers: headers)

        Array(Webhook).from_json(response.body, "webhooks")
      end

      def register!(account_id, url)
        params = HTTP::Params.encode({
          account_id: account_id,
          url: url,
        })
        response = HTTP::Client.post(@base_url, headers: headers, form: params)

        Webhook.from_json(response.body, "webhook")
      end
    end
  end
end
