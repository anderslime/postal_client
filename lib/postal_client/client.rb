module PostalClient
  class Client
    attr_reader :host, :site_key

    def initialize(host, site_key)
      @host     = host
      @site_key = site_key
    end

    def get_postal_district(postal_district_slug)
      get_postal_data "postal_districts", postal_district_slug
    end

    def get_postal_district_by_key(postal_district_key)
      path = postal_district_by_key_path(postal_district_key)
      Response.new(client.get(path))
    end

    private

    def get_postal_data(postal_resource_name, slug)
      path = postal_data_path(postal_resource_name, slug)
      Response.new(client.get(path))
    end

    def postal_data_path(postal_resource_name, slug)
      [postal_resource_path(postal_resource_name), slug].join("/")
    end

    def postal_district_by_key_path(key)
      [postal_resource_path("postal_districts"), "by_key", key].join("/")
    end

    def postal_resource_path(name)
      ["api", site_key, name].join("/")
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
