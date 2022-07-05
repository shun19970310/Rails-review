class Relationship < ApplicationRecord
  # 紐づくモデル名は頭文字を大文字表記
  belongs_to :following, class_name: "User"
  belongs_to :follower, class_name: "User"
end
