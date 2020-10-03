class Post < ApplicationRecord
  belongs_to :user
  
  has_one_attached :cover

  validates :cover, presence: true
  validates :title, presence: true
  validates :body, presence: true
end
