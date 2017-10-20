require 'spec_helper'
require 'pry'

RSpec.describe ScaleBuilder do
  describe '.build' do
    subject { ScaleBuilder.build(root, mode) }

    context 'real scales' do
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
        let(:diatonic_f_minor) { ["F", "G", "Ab", "Bb", "C", "Db", "Eb", "F"] }

        it 'correctly returns a diatonic scale' do
          expect(subject).to eql(diatonic_f_minor)
        end
      end

      context 'F# Minor' do
        let(:root) { 'F#' }
        let(:mode) { 'min' }
        let(:diatonic_f_sharp_minor) { ["F#", "G#", "A", "B", "C#", "D", "E", "F#"] }

        it 'correctly returns a diatonic scale' do
          expect(subject).to eql(diatonic_f_sharp_minor)
        end
      end
    end

    context 'fake scale' do
      context 'Zb major' do
        let(:root) { 'Zb' }
        let(:mode) { 'major' }

        it 'raises an error' do
          expect{ subject }.to raise_error(ScaleBuilder::InvalidRootError)
        end
      end

      context 'F sharp' do
        let(:root) { 'F' }
        let(:mode) { 'sharp' }

        it 'raises an error' do
          expect{ subject }.to raise_error(ScaleBuilder::InvalidModeError)
        end

      end
    end

  end
end
