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

FactoryBot.define do
  factory :user1, class: User do
    id { rand(1..1000) }
    name { "テストユーザー1" }
    email { "test001@example.com" }
    image { nil }
    password_digest { "password" }
  end

  factory :user2, class: User do
    id { rand(1..1000) }
    name { "テストユーザー2" }
    email { "test002@example.com" }
    image { nil }
    password_digest { "password" }
  end
end
