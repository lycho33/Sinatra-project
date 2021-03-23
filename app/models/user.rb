class User < ActiveRecord::Base
    has_many :topics
    has_many :lessons, through: :topics
    has_secure_password
    
end