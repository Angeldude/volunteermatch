require 'spec_helper'

RSpec.describe Volunteermatch::API::KeyStatus do
  subject { Volunteermatch::Client.new('acme','1234567890ABCDEF') }

  describe "getKeyStatus api call" do
    it "returns account username" do
      url = "http://www.volunteermatch.org/api/call?action=getKeyStatus"
      stub = stub_get(url).to_return(status: 200, body: fixture("key_status.json"), headers: { content_type: "application/json" })
      response = JSON.parse(stub.response.body)
      expect(response["accountName"]).to eq("acme")
    end

    it "returns api key" do
      url = "http://www.volunteermatch.org/api/call?action=getKeyStatus"
      stub = stub_get(url).to_return(status: 200, body: fixture("key_status.json"), headers: { content_type: "application/json" })
      response = JSON.parse(stub.response.body)
      expect(response["apiKey"]).to eq("1234567890ABCDEF")
    end

    it "shows api key constraints" do
      url = "http://www.volunteermatch.org/api/call?action=getKeyStatus"
      stub = stub_get(url).to_return(status: 200, body: fixture("key_status.json"), headers: { content_type: "application/json" })
      response = JSON.parse(stub.response.body)
      expect(response).to have_key("apiKeyConstraints")
    end
  end
end
