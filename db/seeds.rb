require 'faker'

User.create(username: 'hello', email: 'hello@gmail.com', password: 'hello')

Lesson.create(
    title: 'Speaking',
    content: 'Learning to converse in colloquial English'
)

# 3.times do 
#     User.last.delete
# end