# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.name          = 'omniauth-rdio'
  gem.version       = '0.1.0'
  gem.author        = 'Gopal Patel'
  gem.email         = 'nixme@stillhope.com'
  gem.license       = 'MIT'
  gem.homepage      = 'https://github.com/nixme/omniauth-rdio'
  gem.summary       = 'OmniAuth strategy for Rdio'
  gem.description   = 'OmniAuth strategy for Rdio'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.require_paths = ['lib']

  # Dependencies
  gem.add_runtime_dependency 'omniauth-oauth', '~> 1.0'
end
