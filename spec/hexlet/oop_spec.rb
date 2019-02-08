RSpec.describe Hexlet::Oop do
  it 'has a version number' do
    expect(Hexlet::Oop::VERSION).not_to be nil
  end

  it 'has retutrn instruction' do
    expect(STDOUT).to receive(:puts).with('jopa')
    Hexlet::Oop::Instruction.print
  end

  context 'when ip_address exists' do
    let!(:ip_address) { '192.167.0.0' }
    subject { Hexlet::Oop::IpAddress.detect_ip_address(ip_address: ip_address) }

    it { is_expected.to eq ip_address }
  end

  context 'when ip_address doesnot exists' do
    let!(:external_ip_address) { '192.167.0.0' }

    subject { Hexlet::Oop::IpAddress.detect_ip_address(ip_address: nil) }
    it 'return external api' do
      expect(Net::HTTP).to receive(:get).and_return(external_ip_address)
      is_expected.to eq external_ip_address
    end
  end

  context ' when address exists' do
    let!(:address) { '192.167.0.0' }
    let!(:expected_info) do
      %q({"as":"AS41754 JSC \"ER-Telecom Holding\"",
          "city":"Penza","country":"Russia","countryCode":"RU",
          "isp":"CJSC \"ER-Telecom Holding\" Penza branch","lat":53.1958,"lon":45,
          "org":"JSC \"ER-Telecom Holding\" Penza Branch","query":"94.181.188.132",
          "region":"PNZ","regionName":"Penzenskaya Oblast'",
          "status":"success","timezone":"Europe/Moscow","zip":"440000"})
    end
    subject { Hexlet::Oop::Information.new(address: address).get_info }

    it 'return info' do
      expect(Net::HTTP).to receive(:get).and_return(expected_info)
      subject
    end
  end
end
