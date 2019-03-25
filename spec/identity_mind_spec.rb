RSpec.describe IdentityMind do
  it 'has a version number' do
    expect(IdentityMind::VERSION)
      .not_to be nil
  end

  describe 'configuration' do
    it 'has default api configuration' do
      expect(described_class.configuration.base_uri)
        .to eq('https://edna.identitymind.com')
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
        # clean configuration
        described_class.send(:instance_variable_set, '@configuration', nil)
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
