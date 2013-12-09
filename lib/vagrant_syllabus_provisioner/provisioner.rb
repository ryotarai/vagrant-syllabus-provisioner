require 'vagrant-syllabus-provisioner'
require 'syllabus'

module VagrantSyllabusProvisioner
  class Provisioner < Vagrant.plugin("2", :provisioner)
    class ExecutionError < Vagrant::Errors::VagrantError
      def error_message
        "Execution failed. Abort."
      end
    end

    def provision
      with_backend do |backend|
        files.each do |file|
          config = Syllabus::Config.new_from_file(file: file, backend: backend)
          config.commands.each do |command|
            result = backend.run_command(command, with_output: true)
            handle_result(command, result)
          end
        end
      end
    end

    private
    def handle_result(command, result)
      if result[:exit_status] != 0
        msg = "`#{command}` failed (exit status is #{result[:exit_status]})"
        machine.ui.error msg, color: :red
        raise ExecutionError
      end
    end

    def files
      fs = config.files || ["syllabus.rb"]
      fs.map do |f|
        File.expand_path(f, machine.env.root_path)
      end
    end

    def with_backend
      machine.communicate.tap do |comm|
        backend = SpecInfraBackend.instance
        backend.communicator = comm
        backend.ui = machine.ui
        backend.set_commands(SpecInfra::Command.const_get(backend.check_os[:family]).new)
        yield backend
      end
    end
  end
end

