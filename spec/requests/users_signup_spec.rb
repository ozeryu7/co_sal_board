require "rails_helper"
Rspec.describe "ユーザー登録", type: :request do
  before do
    get signup_path
  end

  it "正常なレスポンスを返すこと" do
    expect(response).to be_success
    expect(response).to have_http_status "200"
  end
end