class User < ActiveRecord::Base
    has_many :rocks
    has_many :comments, through: :rocks
    has_secure_password
end
