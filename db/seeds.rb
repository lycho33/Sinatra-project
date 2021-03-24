require 'faker'

puts "add edudcation data in DB:Seed"

User.create(username: 'hello', password: 'hello')

# Lesson.create(
#     title:
#     lesson_num:
#     content:
# )

# 3.times do 
#     User.last.delete
# end