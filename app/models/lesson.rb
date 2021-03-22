class Lesson < ActiveRecord::Base
    has_many :topics
    has_many :users, through: :topics #why is this plural?
end