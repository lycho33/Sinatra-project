class LessonController < ApplicationController
    get '/lessons' do
        @lessons = Lessons.all
        erb :'lessons/index'
    end
end