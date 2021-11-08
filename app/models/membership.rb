class Membership < ApplicationRecord
    belongs_to :gym
    belongs_to :client

    validates :gym_id, :client_id, :charge, presence: true
    validates :client_id, uniqueness: { scope: [:gym_id] }
    
    #is this correct? or would the scope be throught the membership id? 
end
