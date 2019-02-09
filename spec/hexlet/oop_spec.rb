RSpec.describe Hexlet::Oop do
  context 'return info' do
    class FakeHttpClient
      def self.get(_url)
        'request sended!'
      end
    end

    subject { Hexlet::Oop::InformationGetter.new('94.181.188.132', http_client: FakeHttpClient).get_info }

    it 'return info' do
      expect(STDOUT).to receive(:puts).with('request sended!')
      subject
    end
  end
end
