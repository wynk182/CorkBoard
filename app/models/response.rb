class Response < ApplicationRecord
  belongs_to :owner
  belongs_to :post
  validates :content, presence: true
end