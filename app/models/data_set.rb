class DataSet < ApplicationRecord
  belongs_to :user
  has_many :links

  acts_as_taggable

  accepts_nested_attributes_for :links, reject_if: :all_blank, allow_destroy: true

  validates :title, presence: true
  validates :body, presence: true

  default_scope { order("updated_at desc") }
end
