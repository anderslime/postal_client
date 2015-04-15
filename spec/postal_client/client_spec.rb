describe PostalClient::Client do
  let(:postal_client) {
    PostalClient::Client.new("http://postalserver.dk", "dk")
  }

  before :each do
    stub_request(
      :get,
      "http://postalserver.dk/api/dk/postal_districts/2830-virum"
    ).to_return(body: JSON.dump({ slug: "2830-virum" }))

    stub_request(
      :get,
      "http://postalserver.dk/api/dk/postal_districts/by_key/virum"
    ).to_return(body: JSON.dump({ slug: "2830-virum" }))
  end

  it "fetches postal district given by the slug" do
    response = postal_client.get_postal_district("2830-virum")
    expect(response).to be_ok
  end

  it "fetches postal district by key" do
    response = postal_client.get_postal_district_by_key("virum")
    expect(response).to be_ok
  end
end
