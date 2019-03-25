require 'ostruct'

RSpec.describe IdentityMind::Entity do
  describe '#path' do
    it 'builds path from class name' do
      expect(described_class.path)
        .to eq('/im/entity')
    end
  end

  describe '#create' do
    before do
      allow(IdentityMind)
        .to receive(:post)
        .and_return(OpenStruct.new(body: '{"json": ["response"]}'))
    end

    it 'calls post on path with params' do
      described_class.create(some: :params)
      expect(IdentityMind)
        .to have_received(:post)
        .with('/im/entity', body: '{"some":"params"}')
    end

    it 'returns instance of Entity' do
      expect(described_class.create(some: :params))
        .to be_a(described_class)
    end

    it 'includes data from response' do
      expect(described_class.create(some: :params).to_h)
        .to eq(json: ['response'])
    end
  end

  describe '#fetch' do
    before do
      allow(IdentityMind)
        .to receive(:get)
        .and_return(OpenStruct.new(body: '{"json": ["response"]}'))
    end

    it 'calls get on path with transaction_id' do
      described_class.fetch(987)
      expect(IdentityMind)
        .to have_received(:get).with('/im/entity/987')
    end

    it 'returns instance of Entity' do
      expect(described_class.fetch(some: :params))
        .to be_a(described_class)
    end

    it 'includes data from response' do
      expect(described_class.fetch(some: :params).to_h)
        .to eq(json: ['response'])
    end
  end
end
