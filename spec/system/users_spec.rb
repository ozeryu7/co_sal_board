require 'rails_helper'

RSpec.describe "Users", type: :system do
  describe "ユーザー登録ページ" do
    before do
      visit new_user_registration_path
    end

    context "ページレイアウト" do
      it "「ユーザー登録」の文字列が存在することを確認" do
        expect(page).to have_content 'ユーザー登録'
      end

      it "正しいタイトルが表示されることを確認" do
        expect(page).to have_title 'Co-sal Board'
      end

      # ログイン機能が出来ているかのテスト。何のテストしたいか。パスワード、メールアドレスなど
      # 表示機能をテストしたいなら別で。
      #テスト書いたら、途中で気づける。
    end
  end
end
