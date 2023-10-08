class User < ApplicationRecord
  belongs_to :company, optional: true
  attr_accessor :token

  has_secure_password
  validates :email, presence: true, uniqueness: true
end
