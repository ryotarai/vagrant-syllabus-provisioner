require 'vagrant-syllabus-provisioner'

module VagrantSyllabusProvisioner
  class Config < Vagrant.plugin("2", :config)
    attr_accessor :files

    def initialize
      @files = UNSET_VALUE
    end

    def finalize!
      @files = nil if @files == UNSET_VALUE
    end
  end
end

