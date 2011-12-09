class Interest < ActiveRecord::Base
  has_many :group_interests, :dependent => :destroy
  has_many :groups, :through => :group_interests
end
