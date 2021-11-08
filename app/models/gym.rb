class Gym < ApplicationRecord
    has_many :memberships, dependent: :destroy
    has_many :clients, through: :memberships

    ###### do you need to call dependent destroy on a has many through relationship? or is it implicit through the parent relationship
end
