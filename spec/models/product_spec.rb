require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'create' do
    context 'with correct params' do
      let(:product) { build(:product) }
      it 'will save without error' do
        expect { product.save! }.not_to raise_error
      end
    end
  end
end
