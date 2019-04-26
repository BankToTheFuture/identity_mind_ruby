RSpec.describe IdentityMind do
  it 'has a version number' do
    expect(IdentityMind::VERSION)
      .not_to be nil
  end

  describe 'configuration' do
    describe 'defaults' do
      it 'has default base_uri' do
        expect(described_class.configuration.base_uri)
          .to eq('https://edna.identitymind.com')
      end

      it 'has default param_length_limit' do
        expect(described_class.configuration.param_length_limit)
          .to eq(128)
      end
    end

    context 'when configuration is performed' do
      before do
        IdentityMind.configure do |config|
          config.base_uri = 'https://custom.url.com'
          config.user     = 'john_doe'
          config.password = 'foobar'
        end
      end

      after do
        described_class.load_default_configuration
      end

      it 'has base_uri assigned' do
        expect(described_class.base_uri)
          .to eq('https://custom.url.com')
      end

      it 'has basic auth set' do
        expect(described_class.default_options[:basic_auth])
          .to eq(password: 'foobar', username: 'john_doe')
      end
    end
  end
end
