class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :rock

  def user_attributes=(user_attributes)
    self.user = User.find_or_create_by(name: user_attributes[:name], password: user_attributes[:password]) unless user_attributes[:name].blank? || user_attributes[:password].blank?
  end

end
