require 'spec_helper'

RSpec.describe ScaleBuilder do
  describe '.build' do
    subject { ScaleBuilder.build(root, mode) }

    let(:root) { 'F' }
    let(:mode) { 'maj' }
    let(:diatonic_f_major) { ["F", "G", "A", "Bb", "C", "D", "E", "F"] }

    it 'correctly returns a diatonic scale' do
      expect(subject).to eql(diatonic_f_major)
    end
  end
end
