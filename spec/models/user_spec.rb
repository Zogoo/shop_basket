require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'create' do
    context 'with correct params' do
      let(:user) { build(:user) }
      it 'will save without error' do
        expect { user.save! }.not_to raise_error
      end
    end
  end
end
