class User < ActiveRecord::Base
    has_many :comments
    has_many :rocks, through: :comments
    has_secure_password
    validates :name, presence: true
    validates :name, length: { minimum: 2 }
end
