require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: user.id)
    @item.category_id = 2
    @item.season_id = 2
  end

  describe '商品登録' do
    # 正常
    context "登録成功時" do
      it '全ての情報が正常に登録されている時' do
        expect(@item).to be_valid
      end

    end

    # 異常
    context '登録失敗時' do

      it '商品名がない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank");
      end

      it '名前が40文字を超えている' do
        @item.name = Faker::Base.regexify('[aあ]{41}')
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)");
      end
      it '商品説明がないと登録できない' do
        @item.content = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank");
      end
      it '商品説明が1000文字を超えると登録できない' do
        @item.content = Faker::Base.regexify('[aあ]{1001}')
        @item.valid?
        expect(@item.errors.full_messages).to include("Content is too long (maximum is 1000 characters)");
      end
      it '商品価格がないと登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank");
      end
      it '価格が数値ではないと登録できない' do
        @item.price = 'a'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number");
      end
      it '商品価格が100円以下だと登録できない' do
        @item.price = 99
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 100");
      end
      it '商品価格が5000円以上だと登録できない' do
        @item.price = 5001
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 5000");
      end
      it '画像がないと登録できない' do
        @item.images = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Images can't be blank");
      end
      it 'キャンペーンIDがないと登録できない' do
        @item.sale_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Sale can't be blank");
      end
      it 'カテゴリーIDがないと登録できない' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank");
      end
      it 'カテゴリーIDが1だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1");
      end
      it '季節IDがないと登録できない' do
        @item.season_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Season can't be blank");
      end
      it '季節IDが1だと登録できない' do
        @item.season_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Season must be other than 1");
      end
      it 'ユーザーがIDがないと登録できない' do
        @item.user_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist");
      end
    end
  end
end
