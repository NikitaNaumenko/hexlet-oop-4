RSpec.describe Hexlet::Oop do
  it 'has retutrn instruction' do
    expect(STDOUT).to receive(:puts).with('jopa')
    Hexlet::Oop::Instruction.print
  end

  context 'return info' do
    let!(:expected_info) do
      %q({"as":"AS41754 JSC \"ER-Telecom Holding\"",
          "city":"Penza","country":"Russia","countryCode":"RU",
          "isp":"CJSC \"ER-Telecom Holding\" Penza branch","lat":53.1958,"lon":45,
          "org":"JSC \"ER-Telecom Holding\" Penza Branch","query":"94.181.188.132",
          "region":"PNZ","regionName":"Penzenskaya Oblast'",
          "status":"success","timezone":"Europe/Moscow","zip":"440000"})
    end
    subject { Hexlet::Oop::Information.new(address: '94.181.188.132').get_info }

    it 'return info' do
      expect(Net::HTTP).to receive(:get).and_return(expected_info)
      subject
    end
  end
end
