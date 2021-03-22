require 'rails_helper'

RSpec.describe Store, type: :model do
  before do
    @store = FactoryBot.build(:store)
  end

  describe '店舗登録' do
    context '登録成功時' do
      it '全ての情報が正常に登録されている時' do
        expect(@store).to be_valid
      end
    end

    context '登録失敗時' do

      it '店舗名が無い' do
        @store.name = ""
        @store.valid?
        expect(@store.errors.full_messages).to include("Name can't be blank")
      end

      it '店名が40文字を超えている' do
        @store.name = Faker::Base.regexify('[aあ]{41}')
        @store.valid?
        expect(@store.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end

      it '電話番号がない' do
        @store.phone = ""
        @store.valid?
        expect(@store.errors.full_messages).to include("Phone can't be blank")
      end

      it '電話番号が10文字を超えている' do
        @store.phone = Faker::Base.regexify('[12]{11}')
        @store.valid?
        expect(@store.errors.full_messages).to include("Phone is invalid")
      end


      it '住所がない' do
        @store.address = ""
        @store.valid?
        expect(@store.errors.full_messages).to include("Address can't be blank")
      end

      it '住所が100文字を超えている' do
        @store.address = Faker::Base.regexify('[aあ]{101}')
        @store.valid?
        expect(@store.errors.full_messages).to include("Address is too long (maximum is 100 characters)")
      end

      it '開店時間がない' do
        @store.open_time = ""
        @store.valid?
        expect(@store.errors.full_messages).to include("Open time can't be blank")
      end

      it '開店時間がデータ型になっていない' do
        @store.open_time = "Nodeta型"
        @store.valid?
        expect(@store.errors.full_messages).to include("Open time can't be blank")
      end


      it '閉店時間がない' do
        @store.close_time = ""
        @store.valid?
        expect(@store.errors.full_messages).to include("Close time can't be blank")
      end

      it '閉店時間がデータ型になっていない' do
        @store.close_time = "Nodata型"
        @store.valid?
        expect(@store.errors.full_messages).to include("Close time can't be blank")
      end

      it '定休日がない' do
        @store.holiday_id = ""
        @store.valid?
        expect(@store.errors.full_messages).to include("Holiday is not a number")
      end

      it '定休日のIDが１になっている' do
        @store.holiday_id = 1
        @store.valid?
        expect(@store.errors.full_messages).to include("Holiday must be other than 1")
      end

      it '定休日のIDが8以上の数値が指定されている' do
        @store.holiday_id = 9
        @store.valid?
        expect(@store.errors.full_messages).to include("Holiday must be less than 8")
      end

      it '店舗外観が登録されていない' do
        @store.images = nil
        @store.valid?
        expect(@store.errors.full_messages).to include("Images can't be blank")
      end

    end
  end
end
