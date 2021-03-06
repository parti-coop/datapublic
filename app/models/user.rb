class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :trackable

  enum role: { admin: "admin", general: "general" }

  validates :name, presence: true, uniqueness: true
end
