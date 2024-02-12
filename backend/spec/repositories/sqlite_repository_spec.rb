require 'rails_helper'

RSpec.describe SqliteRepository, type: :repository do
  describe 'inheritance' do
    describe '#extend' do
      it 'extends correctly from Base Repository' do
        expect(described_class.ancestors[1]).to eq BaseRepository
      end
    end
  end
end
