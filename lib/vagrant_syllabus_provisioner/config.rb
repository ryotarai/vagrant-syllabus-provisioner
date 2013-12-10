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

    def validate(machine)
      if @files && !@files.is_a?(Array)
        return {"syllabus" => ["files must be an array"]}
      end

      {}
    end
  end
end

