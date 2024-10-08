# frozen_string_literal: true

lib = File.expand_path('./lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'apple_music/version'

Gem::Specification.new do |s|
  s.name          = 'apple_music'
  s.version       = AppleMusic::VERSION
  s.authors       = ['Yoshiyuki Hirano', "Rights'Up"]
  s.email         = ['yhirano@me.com', 'hello@rightsup.com', 'diego@eddy.app']

  s.homepage      = 'https://github.com/rightsup/apple_music'
  s.summary       = 'Apple Music API Client Ruby'
  s.description   = s.summary
  s.license       = 'MIT'
  s.files         = Dir.chdir(File.expand_path('.', __dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features|images)/})
    end
  end

  s.bindir        = 'exe'
  s.executables   = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'faraday'
  s.add_dependency 'faraday_middleware'
  s.add_dependency 'jwt', '>= 2.2'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
end
