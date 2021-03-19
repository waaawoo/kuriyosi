require 'rails_helper'

RSpec.describe News, type: :model do
  before do
    user = FactoryBot.create(:user)
    @news = FactoryBot.build(:news, user_id: user.id)
  end

  describe "新着情報登録" do
    # 正常系
    context '登録成功時' do
      it '全ての情報が正しく入力されている時' do
        expect(@news).to be_valid
      end

      it '画像がなくても登録できる' do
        @news.image = nil
        expect(@news).to be_valid
      end

      context '登録失敗時' do

        it 'タイトルがないと登録できない' do
          @news.title = ""
          @news.valid?
          expect(@news.errors.full_messages).to include("Title can't be blank");
        end

        it 'タイトルが40文字以上だと登録できない' do
          @news.title = Faker::Base.regexify('[aあ]{41}')
          @news.valid?
          expect(@news.errors.full_messages).to include("Title is too long (maximum is 40 characters)");
        end
        it '詳細がないと登録できない' do
          @news.content = ""
          @news.valid?
          expect(@news.errors.full_messages).to include("Content can't be blank");
        end
        it '詳細が1000文字以上だと登録できない' do
          @news.content = Faker::Base.regexify('[aあ]{1001}')
          @news.valid?
          expect(@news.errors.full_messages).to include("Content is too long (maximum is 1000 characters)");
        end
        it 'ユーザーIDがないと登録できない' do
          @news.user_id = nil
          @news.valid?
          expect(@news.errors.full_messages).to include("User must exist");
        end
      end
    end
  end
end
