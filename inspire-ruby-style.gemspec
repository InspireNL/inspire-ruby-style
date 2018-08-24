# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name     = "inspire-ruby-style"
  spec.version  = "1.0.0"
  spec.authors  = ["Inspire Innovation BV"]
  spec.email    = ["info@inspire.nl"]

  spec.summary  = "Inspire's shared style guides for Ruby."
  spec.homepage = "https://github.com/InspireNL/inspire-ruby-style"
  spec.license  = "MIT"

  spec.files    = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.add_dependency "rubocop", "~> 0.58"
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
