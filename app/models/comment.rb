#20171005 ED 5.7 Comment Model

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  scope :rating_desc, -> { order(rating: :desc) }
  scope :rating_asc, -> { order(rating: :asc) }

  #20171022 5.9 Validation & Pagination
  #user must be logged in and write a comment and input star rating to save a comment
  validates :body, presence: true
  validates :user, presence: true
  validates :product, presence: true
  validates :rating, numericality: { only_integer: true }

end
