module Monzo
  module API
    # Webhooks allow your application to receive real-time, push notification of
    # events in an account.
    class Webhooks
      delegate :host, :headers, to: Monzo::Client

      def initialize
        @base_url = "#{host}/webhooks"
      end

      # List the webhooks your application has registered on an account.
      def list(account_id)
        params = HTTP::Params.encode({"account_id" => account_id})
        url = "#{@base_url}?#{params}"
        response = HTTP::Client.get(url, headers: headers)

        Array(Webhook).from_json(response.body, "webhooks")
      end

      # Each time a matching event occurs, we will make a POST call to the *url*
      # you provide with the *account_id*. If the call fails, we will retry up
      # to a maximum of 5 attempts, with exponential backoff.
      def register!(account_id, url)
        params = HTTP::Params.encode({
          account_id: account_id,
          url:        url,
        })
        response = HTTP::Client.post(@base_url, headers: headers, form: params)

        Webhook.from_json(response.body, "webhook")
      end
    end
  end
end
