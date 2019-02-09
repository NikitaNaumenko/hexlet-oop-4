RSpec.describe Hexlet::Oop do
  class FakeHttpClient
    def self.get(_url)
      { city: 'Penza', country: 'Russia', regionName: 'Penzenskaya Oblast' }.to_json
    end
  end

  context 'return info' do
    it 'return info' do
      expected_response = { city: 'Penza', country: 'Russia', regionName: 'Penzenskaya Oblast' }.to_json
      geo_ip = Hexlet::Oop::GeoIp.new(client: FakeHttpClient)
      result = geo_ip.get_info(ip_address: '1.2.3.4')
      is_asserted_by { JSON.parse(expected_response) == result }
    end
  end
end
