require "../../spec_helper"
require "file_utils"

describe Monzo::API::Webhooks do
  describe "#list" do
    it "parses the response and returns the right model" do
      fixture = YAML.parse(
        File.read("spec/fixtures/api_response/webhooks/list.yml")
      )

      account_id = fixture["account_id"].to_s

      WebMock
        .stub(:get, fixture["endpoint"].to_s)
        .with(query: {"account_id" => account_id})
        .to_return(body: fixture["response"].to_json)

      Monzo::Client
        .webhooks
        .list(account_id)
        .class
        .should eq Array(Webhook)
    end

    describe "#register!" do
      it "parses the response and returns the right model" do
        fixture = YAML.parse(
          File.read("spec/fixtures/api_response/webhooks/register.yml")
        )

        account_id = fixture["account_id"].to_s
        url = fixture["url"].to_s

        params = HTTP::Params.encode({
          account_id: account_id,
          url:        url,
        })

        WebMock
          .stub(:post, fixture["endpoint"].to_s)
          .with(body: params)
          .to_return(body: fixture["response"].to_json)

        Monzo::Client
          .webhooks
          .register!(account_id, url)
          .class
          .should eq Webhook
      end
    end
  end
end
