# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant_syllabus_provisioner/version'

Gem::Specification.new do |spec|
  spec.name          = "vagrant-syllabus-provisioner"
  spec.version       = VagrantSyllabusProvisioner::VERSION
  spec.authors       = ["Ryota Arai"]
  spec.email         = ["ryota.arai@gmail.com"]
  spec.summary       = %q{Syllabus Provisioner for Vagrant}
  spec.description   = %q{This plugin installs a provisioner that allows Syllabus to provision machines.}
  spec.homepage      = "https://github.com/ryotarai/vagrant-syllabus-provisioner"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "syllabus"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
