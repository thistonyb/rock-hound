class User < ActiveRecord::Base
    has_many :rocks
    has_many :comments, through: :rocks
    has_secure_password
    validates :name, presence: true
    validates :name, length: { minimum: 2 }
    validates :name, uniqueness: true
end
