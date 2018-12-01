class User < ApplicationRecord
    has_secure_password
    has_many :items
    validates :email, presence: true
    validates :name, presence: true

    def self.find_or_create_by_oauth(auth)
        where(email: auth.extra.raw_info.email).first_or_create do |user|
          user.name = auth.extra.raw_info.name
          user.name = "#{auth.extra.raw_info.name}#{user.name.length}"
          user.password = SecureRandom.hex
        end
    end
    
end
