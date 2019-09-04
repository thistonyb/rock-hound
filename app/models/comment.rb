class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :rock
  accepts_nested_attributes_for :user

  def user_attributes=(user_attributes)
    self.user = User.find_or_create_by(name: user_attributes[:name]) unless user_attributes[:name].blank?
  end
end
