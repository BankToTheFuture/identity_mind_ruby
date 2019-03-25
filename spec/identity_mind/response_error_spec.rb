RSpec.describe IdentityMind::ResponseError do
  subject(:error) { described_class.new(body, code) }
  let(:body) { '{"error_message":"Some error"}' }
  let(:code) { 400 }

  it 'has defined body' do
    expect(error.body)
      .to eq(body)
  end

  it 'has defined code' do
    expect(error.code)
      .to eq(code)
  end

  it 'has defined message' do
    expect(error.message)
      .to eq('IdentityMind responded with status 400 => Some error')
  end

  it 'has defined error_message' do
    expect(error.error_message)
      .to eq('Some error')
  end
end
