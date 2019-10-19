module Monzo
  class Client
    Habitat.create do
      setting access_token : String
      setting base_url : String
    end

    def self.headers
      @@headers ||= HTTP::Headers {
        "Authorization" => "Bearer #{settings.access_token}"
      }
    end

    def self.host
      settings.base_url
    end

    def self.accounts
      Monzo::API::Accounts.new
    end

    def self.balance
      Monzo::API::Balance.new
    end

    def self.webhooks
      Monzo::API::Webhooks.new
    end

    def self.whoami?
      Monzo::API::Whoami.new.fetch
    end
  end
end
