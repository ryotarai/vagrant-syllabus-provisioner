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

    describe "#validate" do
      context "with non-array files" do
        before do
          config.files = "non-array"
          config.finalize!
        end
        it "returns a hash containing error messages" do
          expect(config.validate(nil)).to eq({"syllabus" => ["files must be an array"]})
        end
      end
      context "with array files" do
        before do
          config.files = %w! this is array !
          config.finalize!
        end
        it "returns a hash containing no error messages" do
          expect(config.validate(nil)).to eq({})
        end
      end
    end
  end
end

