require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'create' do
    context 'with correct accosiation' do
      let(:merchant) { create(:merchant) }
      it 'will save without error' do
        expect(merchant.name).not_to eq(nil)
        expect(merchant.user).not_to eq(nil)
      end
    end
  end
end
