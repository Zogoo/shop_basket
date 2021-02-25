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

  describe 'search_by_keyword' do
    let!(:product) { create(:product, name: 'usnii sam', tags: ['comb', 'sam', 'kushi']) }
    context 'when search by name' do
      it 'will allow you search by partial name' do
        expect(described_class.search_by_keyword('sam').count).to eq(1)
      end
    end

    context 'when search by tag' do
      it 'will allow you search by tags' do
        expect(described_class.search_by_keyword('comb').count).to eq(1)
      end
    end
  end
end
