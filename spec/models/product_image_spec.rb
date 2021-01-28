require 'rails_helper'

RSpec.describe ProductImage, type: :model do
  describe 'uploaded image' do
    context 'when image uploaded' do
      let(:image) { build(:product_image, :with_image) }
      it 'will save image successfully' do
        expect { image.save! }.not_to raise_error
      end
    end
  end
end
