require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the MakepassHelper. For example:
#
# describe MakepassHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe MakepassHelper, type: :helper do
  pending "add some examples to (or delete) #{__FILE__}"

  describe "#string_to_bool" do
    it "input bool" do
      expect(send("string_to_bool", true)).to eq(true)
    end
    it "input string true" do
      expect(send("string_to_bool", 'true')).to eq(true)
    end
    it "wrong string true" do
      expect(send("string_to_bool", 'tre')).to eq(false)
    end
  end

  describe "#get_wordset" do
    it "enable upper only" do
      expect(send("get_wordset", true,false,false,false)).to eq(('A'..'Z').to_a)
    end
    it "all false" do
      expect(send("get_wordset", false,false,false,false)).to eq(('A'..'Z').to_a)
    end
  end

  describe "#get_password" do
    describe "sinple make" do
      subject{ get_password(2,{length: 6})}
      describe '#length' do
        subject { super().length }
        it { is_expected.to eq(2) }
      end
      describe 'element #length' do
        subject { super()[0].length }
        it { is_expected.to eq(6) }
      end
    end
  end

end
