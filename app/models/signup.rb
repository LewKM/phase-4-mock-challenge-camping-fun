class Signup < ApplicationRecord

    belongs_to :camper
    belongs_to :activity

    validates :time, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 25 }
end
