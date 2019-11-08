class BanList < ApplicationRecord
  belongs_to :match

  validates :match_id, presence: true
  validates :title, presence: true
end
