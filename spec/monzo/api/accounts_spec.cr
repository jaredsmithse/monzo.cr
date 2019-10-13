require "../../spec_helper"
require "file_utils"

describe Monzo::API::Accounts do
  describe "#list" do
    it "parses the response and returns the right model" do
      fixture = YAML.parse(
        File.read("spec/fixtures/api_response/accounts/list.yml")
      )

      WebMock
        .stub(:get, fixture["endpoint"].to_s)
        .to_return(body: fixture["response"].to_json)

      Monzo::Client
        .accounts
        .list
        .class
        .should eq Array(Account)
    end
  end
end
