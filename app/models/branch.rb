class Branch < ApplicationRecord
    belongs_to :bank, dependent: :destroy
    has_many :users
    has_many :accounts
    
end
