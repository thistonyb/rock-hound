class Rock < ActiveRecord::Base
  has_many :comments
  has many :users, through: :comments
  #validates :name, :description, :location, presence: true
end
