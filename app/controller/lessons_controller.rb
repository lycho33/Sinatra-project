class LessonsController < ApplicationController
    get '/lessons' do
        @lessons = Lesson.all
        erb :'lessons/index'
    end

    get '/new' do
        redirect_if_not_logged_in
        erb :'lessons/new'
    end

    #Read 1 lesson
    get '/lessons/:id' do
        redirect_if_not_logged_in
        redirect_if_not_authorized
        erb :'lessons/show'
    end

    #Create new lesson (save in db)
    post '/new' do
        redirect_if_not_logged_in
        lesson = current_user.lessons.build(params[:lesson])
        lesson.save
            redirect "/lessons/#{lesson.id}"
    end

    def redirect_if_not_authorized       
        @lesson = Lesson.find_by_id(params[:id])    
        if @lesson.user_id != session[:user_id]            
            redirect "/lessons"        
        end    
    end

    #Update 1 lesson
    get 'lessons/:id/edit' do
        redirect_if_not_logged_in
        redirect_if_not_authorized
        erb :'lessons/edit'
    end

    patch '/lessons/:id' do
        redirect_if_not_logged_in
        redirect_if_not_authorized
        if @lesson.update(params["lesson"])
            redirect "/movies/#{@lesson.id}"
        else
            redirect "/movies/#{@lesson.id}/edit"
        end
    end
end