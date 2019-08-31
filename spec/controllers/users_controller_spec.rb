require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "POST #create" do
    context "saveが成功" do
      before do
        @params = { user:
          {
            name: "テスト用ユーザーさん",
            email: "test999@example.com",
            password: "password",
            password_confirmation: "password"
          }
        }
      end

      it "new user" do
        user_count = User.all.count
        post :create, params: @params
        expect(response).to have_http_status 302
        expect(User.all.count).to eq user_count + 1
      end
    end

    context "saveが失敗する" do
      before do
        @params = { user:
          {
            name: nil,
            email: nil,
            password: "password",
            password_confirmation: "password"
          }
        }
      end
      it "faild create" do
        post :create, params: @params
        expect(flash[:danger]).to eq "ユーザの登録に失敗しました。"
      end
    end
  end
end
