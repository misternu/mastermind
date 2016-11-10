require_relative '../peg'
require_relative 'spec_helper'

describe Peg do
  let(:peg) { Peg.new("red") }
  describe '#color' do
    it 'returns the color of the peg' do
      expect(peg.color).to eq "red"
    end
  end

  describe'#==' do
    let(:peg1) { Peg.new("yellow") }
    let(:peg2) { Peg.new("yellow") }
    let(:peg3) { Peg.new("orange") }
    it 'returns false if they are not the same' do
      expect(peg2 == peg3).to be false
    end
    it 'returns true if they are not the same' do
      expect(peg1 == peg2).to be true
    end
  end

  describe 'arrays of pegs' do
    let(:array1) {[Peg.new("red"), Peg.new("orange"), Peg.new("yellow")]}
    let(:array2) {[Peg.new("green"), Peg.new("red"), Peg.new("yellow")]}
    it 'returns two items when we take the intersection' do
      expect((array1 & array2).length).to eq 2
    end
  end
end
