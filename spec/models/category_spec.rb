require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'create' do
    context 'with correct params' do
      let(:category) { build(:category, name: 'Cosmetics') }
      it 'will save without error' do
        expect { category.save! }.not_to raise_error
      end
    end
  end
end
