require 'spec_helper'

RSpec.describe ScaleBuilder do
  describe '.build' do
    subject { ScaleBuilder.build(root, mode) }

    context 'F Major' do
      let(:root) { 'F' }
      let(:mode) { 'maj' }
      let(:diatonic_f_major) { ["F", "G", "A", "Bb", "C", "D", "E", "F"] }

      it 'correctly returns a diatonic scale' do
        expect(subject).to eql(diatonic_f_major)
      end
    end

    context 'F Minor' do
      let(:root) { 'F' }
      let(:mode) { 'min' }
      let(:diatonic_f_minor) {["F", "G", "Ab", "Bb#", "C", "Db", "D#", "F"]}

      it 'correctly returns a diatonic scale' do
        expect(subject).to eql(diatonic_f_minor)
      end
    end

  end
end
