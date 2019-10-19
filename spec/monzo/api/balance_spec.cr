require "../../spec_helper"
require "file_utils"

describe Monzo::API::Balance do
  describe "#find" do
    it "parses the response and returns the right model" do
      fixture = YAML.parse(
        File.read("spec/fixtures/api_response/balance/find.yml")
      )

      account_id = fixture["account_id"].to_s

      WebMock
        .stub(:get, fixture["endpoint"].to_s)
        .with(query: { "account_id" => account_id })
        .to_return(body: fixture["response"].to_json)

      Monzo::Client
        .balance
        .find(account_id)
        .class
        .should eq ::Balance
    end
  end
end
