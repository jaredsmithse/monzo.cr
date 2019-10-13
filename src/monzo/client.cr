module Monzo
  class Client
    Habitat.create do
      setting user_id : String
      setting account_id : String
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
  end
end
