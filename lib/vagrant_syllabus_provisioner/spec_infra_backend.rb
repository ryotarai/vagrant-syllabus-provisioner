require 'vagrant-syllabus-provisioner'
require 'specinfra'

module VagrantSyllabusProvisioner
  class SpecInfraBackend < SpecInfra::Backend::Ssh
    attr_accessor :communicator
    attr_accessor :ui

    def run_command(cmd, opts={})
      opts = {with_output: false}.merge(opts)

      stdout = ""
      stderr = ""

      @ui.info cmd, color: :green if opts[:with_output]

      exit_status = @communicator.sudo(cmd, error_check: false) do |type, data|
        case type
        when :stdout
          stdout << data
        when :stderr
          stderr << data
        end
        @ui.info data.chomp if opts[:with_output]
      end

      { :stdout => stdout, :stderr => stderr,
        :exit_status => exit_status, :exit_signal => nil }
    end
  end
end

