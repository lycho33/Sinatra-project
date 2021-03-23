require 'faker'

puts "add edudcation data in DB:Seed"

4.times do 
    Listing.create({
        "fname" => Faker::Name.uniq.name,
        "funiversity" => Faker::Educator.university,
        "fdegree" => Faker::Educator.degree,
        "fcourse" => Faker::Educator.course_name,
        "fsubject" => Faker::Educator.subject
        "user_id" => User.ids.sample 
    })
