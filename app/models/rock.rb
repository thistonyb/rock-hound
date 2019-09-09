class Rock < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :name, :description, :location, presence: true
  scope :most_recent, -> (limit) { order("created_at desc").limit(limit) }
end
