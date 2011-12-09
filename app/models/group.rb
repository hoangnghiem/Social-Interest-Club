class Group < ActiveRecord::Base
  belongs_to :category
  
  belongs_to :admin, :class_name => "User", :foreign_key => "admin_id"
  
  has_many :group_interests, :dependent => :destroy
  has_many :interests, :through => :group_interests
  
  has_many :memberships, :dependent => :destroy
  has_many :members, :through => :memberships, :source => :user
  
  has_many :moderators, :through => :memberships, :source => :user, :conditions => "memberships.role = 1"
  has_many :contributors, :through => :memberships, :source => :user, :conditions => "memberships.role = 2"
  
  attr_accessible :name, :about, :subdomain, :category_id, :interest_tokens, :public
  attr_accessor :interest_tokens
  
  validates :name, :about, :subdomain, :category, :interest_tokens, :presence => true
  validates :subdomain, :subdomain => true
    
  # assign new or existing interests to this group
  def build_interests
    arr = self.interest_tokens.split(',')
    arr.each do |str|
      interest = Interest.find_by_name(str)
      unless interest.blank?
        interests << interest
      else
        interests.build(:name => str)
      end
    end
  end
  
  def update_with_interests
    begin
      Group.transaction do
        # cleanup old interests
        self.group_interests.destroy_all
        arr = self.interest_tokens.split(',')
        arr.each do |str|
          interest = Interest.find_by_name(str)
          unless interest.blank?
            interests << interest
          else
            interests.build(:name => str)
          end
        end
        self.save
      end
    rescue Exception => e
      return false
    end   
  end
  
end
