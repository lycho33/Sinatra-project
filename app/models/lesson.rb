class Lesson < ActiveRecord::Base
    has_many :topics
    has_many :users, through: :topics 
    validates :title, presence: true
end