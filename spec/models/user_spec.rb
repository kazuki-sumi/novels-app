# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  image           :string(255)
#  name            :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  it "sample_test" do
    hello = "Hello World"
    expect(hello).to eq "Hello World"
  end

  it "test" do
    user = FactoryBot.create(:user1)
    expect(user.name).to eq "テストユーザー1"
  end
end
