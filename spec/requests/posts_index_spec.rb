require "rails_helper"

RSpec.describe "投稿一覧ページ", type: :request do
  let!(:user) { create(:user) }
  let!(:user) { create(:dish, user: user) }

  context "ログインしているユーザーの場合" do
    it "レスポンスが正常に表示されること" do
      user_sigend_in_request(user)
      get posts_path
      expect(response).to render_templete('posts/index')
    end
  end
  context "ログインしていないユーザーの場合" do
    it "ログイン画面にリダイレクトすること" do
      get posts_path
      expect(response).to redirect_to usr_session_path
    end
  end
end