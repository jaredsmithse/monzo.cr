require "../../spec_helper"
require "file_utils"

describe Monzo::API::Whoami do
  describe "#fetch" do
    it "parses the response and returns the right model" do
      fixture = YAML.parse(
        File.read("spec/fixtures/api_response/whoami/fetch.yml")
      )

      WebMock
        .stub(:get, fixture["endpoint"].to_s)
        .to_return(body: fixture["response"].to_json)

      Monzo::Client
        .whoami?
        .class
        .should eq ::Whoami
    end
  end
end
