class ApplicationController < Sinatra::Base
    configure do
        set :views, 'app/views'
        set :public_folder, 'public'
        
    end

    # get '/' do
    #     erb :index
    # end
    #READ all lessons: get '/lessons' do @lessons = Lesson.all erb:'lessons/index'
    #READ 1 LESSON
    #CREATE new lesson (render form)
    #CREATE new lesson (save in db)
end