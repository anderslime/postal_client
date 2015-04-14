module PostalClient
  class Response
    attr_reader :client_response

    def initialize(client_response)
      @client_response = client_response
    end

    def ok?
      client_response.status == 200
    end

    def postal_district
      OpenStruct.new(JSON.parse(client_response.body))
    end
  end
end
