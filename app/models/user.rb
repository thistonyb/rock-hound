class User < ActiveRecord::Base
    include BCrypt
    has_many :rocks
    has_many :comments
    has_many :commented_rocks, -> { distinct }, through: :comments, source: :rock
    has_secure_password
    validates :name, presence: true
    validates :name, length: { minimum: 2 }
    validates :name, uniqueness: true

    def self.generic_password
        @password = BCrypt::Password.create(ENV['GENERIC_PASSWORD'])
    end
end
