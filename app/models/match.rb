class Match < ApplicationRecord
    has_many :set_lists, dependent: :destroy
    has_many :ban_lists, dependent: :destroy

    validates :restriction_level,  presence: true
    validates :date,  presence: true
    validates :place,  presence: true
end
