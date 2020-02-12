class Link < ApplicationRecord
  belongs_to :data_set

  validates :url, presence: true
  validates :title, presence: true

  default_scope { order("id desc") }
end