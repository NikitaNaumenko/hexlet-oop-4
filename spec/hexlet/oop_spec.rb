RSpec.describe Hexlet::Oop do
  context 'return info' do
    class FakeHttpClient
      def self.get(_url)
        'request sended!'
      end
    end

    it 'return info' do
      expect(Hexlet::Oop::InformationGetter.new(ip: '94.181.188.132').get_info(http_client: FakeHttpClient)).
        to eq('request sended!')
    end
  end
end
