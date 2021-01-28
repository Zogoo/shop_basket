require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'create' do
    context 'with correct accosiation' do
      let(:order) { build(:order) }
      it 'will save without error' do
        expect { order.save! }.not_to raise_error
      end
    end
  end
end
