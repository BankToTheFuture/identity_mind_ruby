require 'ostruct'

RSpec.describe IdentityMind::Params do
  before(:all) do
    IdentityMind.configure { |config| config.param_length_limit = 6 }
  end

  after(:all) do
    IdentityMind.load_default_configuration
  end

  describe '#[]' do
    context 'when passing hash' do
      it 'creates new Params object' do
        expect(described_class[some: :param]).to be_a(described_class)
      end

      it 'creates has assigned given value' do
        expect(described_class[some: :param].some).to eq('param')
      end
    end

    context 'when passing Params' do
      let(:params) { described_class.new(some: :param) }
      it 'returns self' do
        expect(described_class[params]).to be_equal(params)
      end
    end
  end

  it 'changes symbol values to strings' do
    expect(described_class.new(some: :symbol).some).to eq('symbol')
  end

  it 'trims too long value on initialization' do
    expect(described_class.new(some: 'long value').some).to eq('long v')
  end

  it 'trims too long value on assignment via attribute name method' do
    params = described_class.new
    params.some = :long_value
    expect(params.some).to eq('long_v')
  end

  it 'trims too long value on assignment via [] method' do
    params = described_class.new
    params[:some] = :long_value
    expect(params.some).to eq('long_v')
  end
end
