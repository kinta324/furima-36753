require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @order_address = FactoryBot.build(:address)
  end
  describe '商品情報入力' do
    context '商品情報入力がうまくいかない時' do
      it 'すべての値が正しく入力されていれば購入できること' do
        @order_address = FactoryBot.create(:user)
        expect(@order_address).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Order must exist")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Order must exist')
      end
      it 'regionを選択していないと保存できないこと' do
        @order_address.region_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Order must exist")
      end
      it 'cityが空だと保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Order must exist")
      end
      it 'house_numberが空だと保存できないこと' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Order must exist")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Order must exist")
      end
      it 'phone_numberが11以下だと保存できないこと' do
        @order_address.phone_number = '111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Order must exist")
      end
      it 'phone_numberが数値でなければ保存できないこと' do
        @order_address.phone_number = 'aaaa'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Order must exist")
      end
    end
  end
end
