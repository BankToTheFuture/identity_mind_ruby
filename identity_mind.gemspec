lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'identity_mind/version'

Gem::Specification.new do |spec|
  spec.name          = 'identity-mind'
  spec.version       = IdentityMind::VERSION
  spec.authors       = ['Wojciech Widenka']
  spec.email         = ['wojtek@codegarden.online']

  spec.summary       = 'Simple Identity Mind API client.'
  spec.description   = 'Simple Identity Mind API client.'
  spec.homepage      = 'https://github.com/BankToTheFuture/identity_mind_ruby'

  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0")
                     .reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'

  spec.add_dependency 'httparty', '~>0.14'
end
