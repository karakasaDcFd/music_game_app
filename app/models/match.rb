class Match < ApplicationRecord
    validates :restriction_level,  presence: true
    validates :date,  presence: true
    validates :place,  presence: true
end
