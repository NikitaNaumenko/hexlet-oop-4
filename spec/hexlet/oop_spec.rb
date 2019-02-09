RSpec.describe Hexlet::Oop do
  class FakeHttpClient
    def self.get(_url)
      { city: 'Penza', country: 'Russia', regionName: 'Penzenskaya Oblast' }.to_json
    end
  end

  class FakeHttpClient2
    def self.get(_url)
      { city: 'Moscow', country: 'Russia', regionName: 'Moscow Oblast' }.to_json
    end
  end

  it 'return info' do
    geo_ip = Hexlet::Oop::GeoIp.new(client: FakeHttpClient)
    result = geo_ip.get_info(ip_address: '1.2.3.4')

    is_asserted_by { result['city'] == 'Penza' }
    is_asserted_by { result['country'] == 'Russia' }
    is_asserted_by { result['regionName'] == 'Penzenskaya Oblast' }
  end

  it 'return info' do
    geo_ip = Hexlet::Oop::GeoIp.new
    result = geo_ip.get_info(ip_address: '1.2.3.4', client: FakeHttpClient2)

    is_asserted_by { result['city'] == 'Moscow' }
    is_asserted_by { result['country'] == 'Russia' }
    is_asserted_by { result['regionName'] == 'Moscow Oblast' }
  end
end
