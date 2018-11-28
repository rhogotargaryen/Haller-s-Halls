class User < ApplicationRecord
    has_many :items
    validates :first_name, presence: true
    validates :email, presence: true
    
end
