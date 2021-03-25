class User < ActiveRecord::Base
    has_many :topics
    has_many :lessons, through: :topics
    has_secure_password
    validates :username, presence: true, uniqueness: true
end