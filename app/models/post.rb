class Post < ApplicationRecord
  belongs_to :user
  
  has_one_attached :cover

  default_scope { order('id desc') }

  validates :cover, presence: true
  validates :title, presence: true
  validates :body, presence: true
end
