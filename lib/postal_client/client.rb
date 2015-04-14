module PostalClient
  class Client
    attr_reader :host, :site_key

    def initialize(host, site_key)
      @host     = host
      @site_key = site_key
    end

    def get_postal_district(postal_district_slug)
      path = postal_district_path(postal_district_slug)
      Response.new(client.get(path))
    end

    def get_postal_district_by_key(postal_district_key)
      path = postal_district_by_key_path(postal_district_key)
      Response.new(client.get(path))
    end

    private

    def postal_district_path(slug)
      [postal_districts_path, slug].join("/")
    end

    def postal_district_by_key_path(key)
      [postal_districts_path, "by_key", key].join("/")
    end

    def postal_districts_path
      ["api", site_key, "postal_districts"].join("/")
    end

    def client
      Faraday.new(url: URI::encode(host), headers: headers) do |c|
        c.use Faraday::Request::UrlEncoded
        c.use Faraday::Adapter::Excon
      end
    end

    def headers
      { 'Content-Type' => 'application/json'}
    end
  end
end
