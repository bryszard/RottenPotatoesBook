class Review < ActiveRecord::Base
    belongs_to :movie
    belongs_to :moviegoer
    
    attr_protected :moviegoer_id
    
    
    def self.recent
        where('created_at < ?', 2.days.ago)
    end
    
end