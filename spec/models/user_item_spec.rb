require 'rails_helper'

RSpec.describe UserItem, type: :model do
  describe '配送先の保存' do
    before do
      @user_item = FactoryBot.build(:user_item)
    end

    it '全ての値が正しく入力されていれば保存できること' do
      expect(@user_item).to be_valid
    end
    it 'post_codeが空だと保存できないこと' do
      @user_item.post_code = nil
      @user_item.valid?
      expect(@user_item.errors.full_messages).to include("Post code can't be blank")
    end
    it 'post_codeにハイフンがないと保存できないこと' do
      @user_item.post_code = 1_234_567
      @user_item.valid?
      expect(@user_item.errors.full_messages).to include('Post code is invalid')
    end
    it 'prefecture_idが1では保存できないこと' do
      @user_item.prefecture_id = 1
      @user_item.valid?
      expect(@user_item.errors.full_messages).to include('Prefecture must be other than 1')
    end
    it 'cityが空では保存できないこと' do
      @user_item.city = nil
      @user_item.valid?
      expect(@user_item.errors.full_messages).to include("City can't be blank")
    end
    it 'block_numberが空では保存できないこと' do
      @user_item.block_number = nil
      @user_item.valid?
      expect(@user_item.errors.full_messages).to include("Block number can't be blank")
    end
    it 'building_nameは空でも保存できること' do
      @user_item.building_name = nil
      expect(@user_item).to be_valid
    end
    it 'phone_numberが空では保存できないこと' do
      @user_item.phone_number = nil
      @user_item.valid?
      expect(@user_item.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが10桁か11桁でないと保存できないこと' do
      @user_item.phone_number = 123_456_789_123
      @user_item.phone_number = 123_456_789
      @user_item.valid?
      expect(@user_item.errors.full_messages).to include('Phone number is invalid')
    end
    it 'phone_numberにハイフンがあると保存できないこと' do
      @user_item.phone_number = '123-4567-8901'
      @user_item.valid?
      expect(@user_item.errors.full_messages).to include('Phone number is invalid')
    end
  end

  describe 'カード情報の保存' do
    before do
      @user_item = FactoryBot.build(:user_item)
    end

    it 'tokenがあれば保存できること' do
      expect(@user_item).to be_valid
    end
    it 'tokenが空では保存できないこと' do
      @user_item.token = nil
      @user_item.valid?
      expect(@user_item.errors.full_messages).to include("Token can't be blank")
    end
  end
end
