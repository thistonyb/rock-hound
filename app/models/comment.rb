class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :rock

  # def user_attributes=(user_attributes)
  #   self.user = User.find_or_create_by(name: user_attributes[:name], password: user_attributes[:password])
  # end

  def user_attributes=(user_attributes)
    user = User.find_by(name: user_attributes[:name])
    if !user 
       user = User.create(name: user_attributes[:name], password: user_attributes[:password]) 
    end 
    self.user = user 
  end
end
