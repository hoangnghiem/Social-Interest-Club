class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  belongs_to :admin, :class_name => "User"
  belongs_to :moderator, :class_name => "User"
  belongs_to :contributor, :class_name => "User"
  
  # VALIDATION
  validates_presence_of :role, :user, :group
end
