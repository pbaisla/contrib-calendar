# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'contribcalendar/version'

Gem::Specification.new do |spec|
  spec.name          = "contribcalendar"
  spec.version       = Contribcalendar::VERSION
  spec.authors       = ["Prashant Baisla"]
  spec.email         = ["prashantbaisla@gmail.com"]

  spec.summary       = %q{Generate an image containing your GitHub contribution calendar.}
  spec.homepage      = "https://github.com/pbaisla/contrib-calendar"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"

  spec.add_runtime_dependency "nokogiri"
  spec.add_runtime_dependency "rmagick"
end
