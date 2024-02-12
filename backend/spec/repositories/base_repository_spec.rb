require 'rails_helper'

RSpec.describe BaseRepository, type: :repository do
  describe 'methods' do
    let(:subject) { described_class.new }
    let(:data) { [{ sample: 1 }] }

    describe '#initialize' do
      it 'returns correct data' do
        expect(described_class.new(data).data).to eq data
      end
    end

    it "raises NotImplementedError when find_all is called" do
      expect { BaseRepository.new(nil).find_all }.to raise_error(NotImplementedError)
    end
  end
end
