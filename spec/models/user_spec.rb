require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Name can't be blank"
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it "emailに@がない場合は登録できないこと " do
      @user = FactoryBot.build(:user, email: "aaaaaa")
      @user.valid?
      expect(@user.errors[:email]).to include("is invalid")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it "passwordがない場合は登録できないこと" do
      @user = FactoryBot.build(:user, password: nil)
      @user.valid?
      expect(@user.errors[:password]).to include("can't be blank")
    end

    it "passwordが7文字以上であれば登録できること" do
      password = Faker::Internet.password(min_length: 7, max_length: 7)
      @user = FactoryBot.build(:user, password: password, password_confirmation: password)
      @user.valid?
      expect(@user).to be_valid
    end

    it "passwordが6文字以下であれば登録できないこと" do
      @user.password = '890io'
      @user.password_confirmation = '890io'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it "passwordが7文字以上で、英数字の組み合わせであれば登録できること" do
      @user = FactoryBot.build(:user, password: "abcd123", password_confirmation: "abcd123")
      @user.valid?
      expect(@user).to be_valid
    end

    it "passwordが数字のみの場合は登録できないこと" do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it "passwordが英文字のみの場合は登録できないこと" do
      @user.password = 'asdzxc'
      @user.password_confirmation = 'asdzxc'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it "password_confirmationがない場合は登録できないこと" do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordとpassword_confirmationが一致していない場合は登録できないこと" do
      @user = FactoryBot.build(:user, password: "abcd123", password_confirmation: "1234abc")
      @user.valid?
      expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "first_nameがない場合は登録できないこと" do
      @user = FactoryBot.build(:user, first_name: nil)
      @user.valid?
      expect(@user.errors[:first_name]).to include("can't be blank")
    end

    it "family_nameがない場合は登録できないこと" do
      @user = FactoryBot.build(:user, family_name: nil)
      @user.valid?
      expect(@user.errors[:family_name]).to include("can't be blank")
    end

    it "family_nameがない場合は登録できないこと" do
      @user = FactoryBot.build(:user, family_name: nil)
      @user.valid?
      expect(@user.errors[:family_name]).to include("can't be blank")
    end

    it "family_kanaがない場合は登録できないこと" do
      @user = FactoryBot.build(:user, family_name: nil)
      @user.valid?
      expect(@user.errors[:family_name]).to include("can't be blank")
    end

    it "birth_dayがない場合は登録できないこと" do
      @user = FactoryBot.build(:user, birth_day: nil)
      @user.valid?
      expect(@user.errors[:birth_day]).to include("can't be blank")
    end
  end

  describe '#ぜんかく' do

    it "first_nameが全角文字であれば登録できること" do
      @user = FactoryBot.build(:user, first_name: "ぜんかく")
      @user.valid?
      expect(@user).to be_valid
    end

    it "family_nameが全角文字であれば登録できること" do
      @user = FactoryBot.build(:user, family_name: "ぜんかく")
      @user.valid?
      expect(@user).to be_valid
    end

  end

  describe '#ゼンカクカナ' do

    it "first_kanaが全角カナ文字であれば登録できること" do
      @user = FactoryBot.build(:user, first_name_kana: "ゼンカクカナ")
      @user.valid?
      expect(@user).to be_valid
    end

    it "family_nameが全角カナ文字であれば登録できること" do
      @user = FactoryBot.build(:user, family_name_kana: "ゼンカクカナ")
      @user.valid?
      expect(@user).to be_valid
    end
  end
end