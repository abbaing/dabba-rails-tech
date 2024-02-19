require 'rails_helper'

RSpec.describe BaseBoundary, type: :boundary do
  describe 'methods' do
    let(:subject) { described_class.new }

    it 'raises NotImplementedError when find_all is called' do
      expect { described_class.new.find_all }.to raise_error(NotImplementedError)
    end
  end
end
