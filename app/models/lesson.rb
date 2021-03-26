class Lesson < ActiveRecord::Base
    # has_many :topics
    belongs_to :user
    # has_many :users, through: :topics 
    validates :title, presence: true
end