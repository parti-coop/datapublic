class DataSet < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true

  default_scope { order("updated_at desc") }
end
