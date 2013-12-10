require 'spec_helper'

module VagrantSyllabusProvisioner
  describe VagrantSyllabusProvisioner::Config do
    subject(:config) { described_class.new }

    context "default" do
      before { config.finalize! }
      its(:files) { should be_nil }
    end

    context "set" do
      before do
        config.files = %w! a b !
        config.finalize!
      end
      its(:files) { should eq %w! a b ! }
    end
  end
end

