class User < ApplicationRecord
  has many :recipesRec
  has_secure_password
  validates :email, presence: true, uniqueness: true
end
