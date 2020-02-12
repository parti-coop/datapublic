class DataSet < ApplicationRecord
  belongs_to :user
  has_many :links

  validates :title, presence: true
  validates :body, presence: true

  accepts_nested_attributes_for :links, reject_if: :all_blank, allow_destroy: true

  default_scope { order("updated_at desc") }
end
