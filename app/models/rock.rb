class Rock < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  #validates :name, :description, :location, presence: true
end
