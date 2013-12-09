require 'vagrant-syllabus-provisioner'
require "vagrant"

module VagrantSyllabusProvisioner
  class Plugin < Vagrant.plugin("2")
    name "syllabus"
    description <<-DESC
    This plugin installs a provisioner that allows Syllabus to provision machines.
    DESC

    config :syllabus, :provisioner do
      require_relative "config"
      Config
    end

    provisioner :syllabus do
      require_relative 'provisioner'
      Provisioner
    end
  end
end
