class Archive < ApplicationRecord
  belongs_to :user
  has_many :data_sets
  has_many :posts

  has_one_attached :cover

  validates :slug, presence: true, format: {
    with: %r{\A[a-z](?:[a-z0-9-]*[a-z0-9])?\z}i, message: "not a valid subdomain"
  }, length: { in: 1..63 }
  validates :cover, presence: true
  validates :title, presence: true
  validates :body, presence: true
end
