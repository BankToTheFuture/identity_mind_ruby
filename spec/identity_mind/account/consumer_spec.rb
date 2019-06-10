require 'ostruct'

RSpec.describe IdentityMind::Account::Consumer do
  it 'has Entity superclass' do
    expect(described_class.superclass)
      .to eq(IdentityMind::Entity)
  end

  describe '#path' do
    it { expect(described_class.path).to eq('/im/account/consumer') }
  end
end
