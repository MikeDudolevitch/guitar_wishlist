class Guitar < ActiveRecord::Base
    belongs_to :user
    validates :maker, presence: true
    validates :model, presence: true
end