class Moviegoer < ActiveRecord::Base
    attr_accessible :uid, :provider, :name # deprecated! should use strong parameters?
    
    def self.create_with_omniauth(auth)
        Moviegoer.create!(
            provider: auth["provider"],
            uid: auth["uid"],
            name: auth["info"]["name"])
    end
    
    
end
