require 'rails_helper'

RSpec.describe Basket, type: :model do
  describe 'create' do
    context 'correct fields' do
      let(:basket) { create(:basket) }
      it 'will associate user and product' do
        expect(basket.user).not_to eq(nil)
        expect(basket.product).not_to eq(nil)
      end
    end
  end
end
