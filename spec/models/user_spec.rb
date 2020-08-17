require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "nicknameが空では登録できないこと" do
      @user.nickname = nil
      @user.vaild?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.vaild?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
    　expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "emailが一意性であること" do
      user = User.create(name: "Test", user_id: "test", email: "taro@example.com")
      expect(user).to_not be_valid
      expect(user.errors[:email]).to include("has already been taken")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.vaild?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordが6文字以上であれば登録できること" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      expect(@user).to be_valid
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "123456"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    test "パスワードに不正な文字がないか" do
      ngs = %w(pass/word pass.word |~=?+"a" １２３４５６７８ ＡＢＣＤＥＦＧＨ)
      format = ["パスワードは半角英数字、ﾊｲﾌﾝ、ｱﾝﾀﾞｰﾊﾞｰが使えます"]
      ngs.each do |ng|
        user.password = ng
        user.save
        assert_equal(format, user.errors.full_messages)
      end
    end

    it"family_nameが空では登録できないこと" do
      @user.family_name = nil
      @user.vaild?
      expect(@user.errors.full_messages).to include("Family_name can't be blank")
    end
    
    it"first_nameが空では登録できないこと" do
      @user.first_name = nil
      @user.vaild?
      expect(@user.errors.full_messages).to include("First_name can't be blank")
    end
    
    it"family_name_kanaが空では登録できないこと" do
      @user.family_name_kana = nil
      @user.vaild?
      expect(@user.errors.full_messages).to include("Family_name_kana can't be blank")
    end
    
    describe '#katakana' do
      it 'family_name_kanaがカタカナで返ること' do
        user = build(:user, family_name_kana: "kana")
        user.valid?
        expect(user.errors[:family_name_kana]).to include("はカタカナで入力してください")
      end

    it"first_name_kanaが空では登録できないこと" do
      @user.first_name_kana = nil
      @user.vaild?
      expect(@user.errors.full_messages).to include("First_name_kana can't be blank")
    end

    it 'first_name_kanaがカタカナで返ること' do
      user = build(:user, first_name_kana: "kana")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("はカタカナで入力してください")
    end

    it"birthdayが空では登録できないこと" do
      @user.birthday = nil
      @user.vaild?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
