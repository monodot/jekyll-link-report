require_relative "lib/jekyll-link-report/version"

Gem::Specification.new do |spec|
    spec.name          = "jekyll-link-report"
    spec.version       = Jekyll::LinkReport::VERSION
    spec.authors       = ["Tom Donohue"]
    spec.email         = ["monodot@gmail.com"]
    spec.summary       = "Jekyll plugin to produce reports about your Jekyll site."
    spec.description   = "Jekyll plugin to produce reports about your Jekyll site."
    spec.homepage      = "https://github.com/monodot/jekyll-link-report"
    spec.license       = "MIT"

    spec.files         = `git ls-files -z`.split("\x0").grep(%r!^lib/!)
    spec.require_paths = ["lib"]

    spec.required_ruby_version = ">= 2.4.0"

    spec.add_dependency "jekyll", ">= 3.7", "< 5.0"
    spec.add_dependency "nokogiri", "~> 1.6" # So that we can work with HTML

    spec.add_development_dependency "bundler"
    spec.add_development_dependency "rake", "~> 12.0"
    spec.add_development_dependency "rspec", "~> 3.0"
    # spec.add_development_dependency "rubocop-jekyll", "~> 0.5"
end
