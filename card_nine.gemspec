# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'card_nine'
  spec.version       = File.read('VERSION')
  spec.authors       = ['Scott M Parrish']
  spec.email         = ['anithri@gmail.com']
  spec.summary       = %q{Game Dev Toolbox. Cards }
  spec.description   = %q{A Toolbox to help me build a board game.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'virtus', '~> 1.0.3'
  spec.add_runtime_dependency 'facets', '~> 2.9.3'
  spec.add_runtime_dependency 'hashie', '~> 3.3.1'

  spec.add_development_dependency 'bundler', '~> 1.7.6'
  spec.add_development_dependency 'rake', '~> 10.3.2'
  spec.add_development_dependency 'rspec', '~> 3.1.0'
  spec.add_development_dependency 'guard-rspec', '~> 4.3.1'
  spec.add_development_dependency 'guard-bundler', '~> 2.0.0'
  spec.add_development_dependency 'version', '~> 1.0.0'
  spec.add_development_dependency 'fuubar', '~> 2.0.0'
  spec.add_development_dependency 'pry'
end
