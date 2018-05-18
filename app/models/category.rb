class Category < ApplicationRecord
  has_many :board_categories
  has_many :boards, through: :board_categories
  has_many :post_categories
  has_many :posts, through: :post_categories
end