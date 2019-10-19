module Monzo
  module API
    class Whoami
      delegate :host, :headers, to: Monzo::Client

      def initialize
        @base_url = "#{host}/ping/whoami"
      end

      def fetch
        response = HTTP::Client.get(@base_url, headers: headers)

        ::Whoami.from_json(response.body)
      end
    end
  end
end
