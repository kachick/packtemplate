# coding: us-ascii

require_relative 'helper'

describe PackTemplate do
  context ".builder" do
    before(:each) do
      @template = 'C*S1w5'
    end

    it "returns equal value when passed all conditions" do
      template = PackTemplate.build do
        unsigned_char :infinite
        uint16_t
        ber_compressed_int 5
      end

      expect(@template).to eq(template)
    end

    it "parses result to pack-template" do
      expect(PackTemplate.for_summary(PackTemplate.summarize(@template))).to eq(@template)
    end
  end
end