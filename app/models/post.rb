class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  enum status: %i[draft published promoted landing]
end
