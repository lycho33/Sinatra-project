class LessonsController < ApplicationController
    get '/lessons' do
        @lessons = Lesson.all
        erb :'lessons/index'
    end

    get '/lessons/new' do
        redirect_if_not_logged_in
        erb :'lessons/new'
    end

    #Read 1 topic
    get '/lessons/:id' do
        redirect_if_logged_in
        redirect_if_not_logged_in
        erb :'lessons/show'
    end

    #Create new topic (save in db)
    post '/lessons' do
        redirect_if_not_logged_in
        lesson = current_user.lessons.build(params["lesson"])
        if lesson.save
            redirect "/lessons/#{lesson.id}"
        else
            "Error #{lesson.errors.full_messages.join(", ")}"
        end
    end
end