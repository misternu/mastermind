require_relative '../peg'
require_relative 'spec_helper'

describe Peg do
  let(:peg) { Peg.new("red") }
  describe '#color' do
    it 'returns the color of the peg' do
      expect(peg.color).to eq "red"
    end
  end
end
