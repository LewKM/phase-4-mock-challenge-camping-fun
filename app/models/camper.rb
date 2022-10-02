class Camper < ApplicationRecord

    has_many :signups
    has_many :activities, through: :signups

    validates :name, presence: true
    validates :age, presence: true, numericality: { only_integer: true, greater_than: 8, less_than: 18 }
end
