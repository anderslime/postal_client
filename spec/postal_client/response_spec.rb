describe PostalClient::Response do
  context "given a valid postal district response" do
    let(:client_response) {
      double("ValidPostalDistrict",
        status: 200,
        body: JSON.dump({ id: "2830" })
      )
    }

    it "is ok" do
      expect(PostalClient::Response.new(client_response)).to be_ok
    end

    it "returns a postal district from the json body" do
      response = PostalClient::Response.new(client_response)
      expect(response.postal_district.id).to eq("2830")
    end
  end

  context "given a invalid postal district" do
    let(:client_response) {
      double("InvalidPostalDistrict",
        status: 404,
        body: JSON.dump({ error: "no_found" })
      )
    }

    it "is not ok" do
      expect(PostalClient::Response.new(client_response)).not_to be_ok
    end
  end
end
