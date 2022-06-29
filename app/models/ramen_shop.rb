class RamenShop < ApplicationRecord
  has_many :reviews, dependent: :destroy
end
