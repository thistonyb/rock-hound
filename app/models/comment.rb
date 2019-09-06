class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :rock

  def user_attributes=(user_attributes)
    self.user = User.find_or_create_by(name: user_attributes[:name], password_digest: user_attributes[:password_digest])
  end

end
