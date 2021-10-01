require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報入力' do
    context '商品情報入力がうまくいかない時' do
      it '全ての値が正しく入力されていれば出品できること' do
        @item = FactoryBot.create(:user)
        expect(@item).to be_valid
      end
    end
    context '商品情報の入力がうまく行かない時' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空だと出品できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'categoryが未選択だと出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Category can't be blank")
      end
      it 'item_conditionが未選択だと出品できない' do
        @item.item_condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Item condition can't be blank")
      end
      it 'postageが未選択だと出品できない' do
        @item.postage_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end
      it 'shipping_dateが未選択だと出品できない' do
        @item.shipping_date_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end
      it 'regionが未選択だと出品できない' do
        @item.region_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Region can't be blank")
      end
      it 'priceが空だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角数字だと出品できない' do
        @item.price = ２０００
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '売価格は、¥300~¥9,999,999の間のみ保存可能であること' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.category_id = [1]
        @item.valid?
        expect(@item.errors.full_messages).to include ("Category can't be blank")
      end
      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.item_condition_id = [1]
        @item.valid?
        expect(@item.errors.full_messages).to include ("Item condition can't be blank")
      end
      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.postage_id = [1]
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end
      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @item.shipping_date_id = [1]
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end
      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @item.region_id = [1]
        @item.valid?
        expect(@item.errors.full_messages).to include("Region can't be blank")
      end
      it '英字では保存できないこと' do
        @item.price = "aaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '英数字混合では保存できないこと' do
        @item.price = "aaa123"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '10000000以上の値では保存できないこと' do
        @item.price = 20000000000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end