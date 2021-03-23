class ApplicationController < Sinatra::Base
    configure do
        set :views, 'app/views'
        set :public_folder, 'public'
        enable :sessions
        set :session_secret, ENV['SESSION_SECRET']
    end

    get '/' do
        erb :home
    end

    helpers do
        def current_user
            @current_user ||= User.find_by_id(session["user_id"])
        end

        def logged_in?
            !!current_user
        end
        
        def redirect_if_not_logged_in
            redirect "/login" if !logged_in?
        end

        def redirect_if_logged_in
            redirect "/movie" if logged_in?
        end
    end
    #READ all lessons: get '/lessons' do @lessons = Lesson.all erb:'lessons/index'
    #READ 1 LESSON
    #CREATE new lesson (render form)
    #CREATE new lesson (save in db)
end