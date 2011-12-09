class User < ActiveRecord::Base
  
  has_many :memberships, :dependent => :destroy
  has_many :groups, :through => :memberships
  
  devise :omniauthable, :trackable
  
  # CLASS METHODS
  # -------------
  class << self
    def find_for_open_id(access_token, signed_in_resource=nil)
      data = access_token.info
      if user = User.find_by_provider_and_uid(access_token.provider, access_token.uid)
        user
      else
        name   = data['name']   unless data['name'].blank?
        name ||= data['nickname'] unless data['nickname'].blank?
        name ||= (data['first_name'] + " " +data['last_name']) unless data['first_name'].blank? || data['last_name'].blank?
        User.create!(:email => data["email"], 
                    :encrypted_password => Devise.friendly_token[0,20],
                    :name => name,
                    :provider => access_token.provider,
                    :uid => access_token.uid)
      end
    end
  end
end
