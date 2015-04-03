# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'lazycuke/version'

Gem::Specification.new do |spec|
  spec.name          = "lazycuke"
  spec.version       = Lazycuke::VERSION
  spec.authors       = ["Shashikant86"]
  spec.email         = ["shashikant.jagtap@aol.co.uk"]
  spec.summary       = %q{BDD framework for Selenium, Appium, Cucumber and friendspec.}
  spec.description   = %q{Test automation framework to be used with Ruby Cucumber, Selenium and mobile automation framework Appium.}
  spec.homepage      = ""
  spec.license       = "MIT"
  spec.date        = Time.now
  spec.platform    = Gem::Platform::RUBY
  spec.files       = Dir['lib/**/*']
  spec.files      += Dir['bin/*']
  spec.files      += Dir['scaffold/**/*']
  spec.require_paths = ['lib']
  spec.executables   = 'lazycuke'
  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {features}/*`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }

  spec.required_ruby_version = '>= 1.9.3'
  spec.add_runtime_dependency 'cucumber', '~> 1.3', '>= 1.3.18'
  spec.add_runtime_dependency 'selenium-webdriver', '~> 2.44.0', '>= 2.41.0'
  spec.add_runtime_dependency 'appium_lib', '~> 4.1.0', '>= 4.0.0'
  spec.post_install_message = "Thanks for installing lazycuke gem!"
end
