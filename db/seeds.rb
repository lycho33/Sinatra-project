require 'faker'

puts "add edudcation data in DB:Seed"

User.create(username: 'hello', password: 'hello')

Movie.create(
    title: 
    year:
    description:
    director_id:
)

3.times do 
    User.last.delete
end