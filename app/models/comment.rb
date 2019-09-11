class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :rock
  validates :content, presence: true

  def user_attributes=(user_attributes)
    user = User.find_by(name: user_attributes[:name])
    if !user 
       user = User.create(name: user_attributes[:name], password: user_attributes[:password]) 
    end 
    self.user = user 
  end
end
