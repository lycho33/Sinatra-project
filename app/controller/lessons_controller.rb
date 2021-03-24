class LessonsController < ApplicationController
    get '/lessons' do
        @lessons = Lesson.all
        erb :'lessons/index'
    end

    get '/new' do
        redirect_if_not_logged_in
        erb :'lessons/new'
    end

    #Create new lesson (save in db)
    post '/new' do
        redirect_if_not_logged_in
        lesson = Lesson.new(title: params["lessons"]["title"], content: params["lessons"]["content"], user_id: current_user.id)
        if lesson.save
            redirect "/lessons/#{lesson.id}"
        else
            redirect '/lessons'
        end
    end

    #Read 1 lesson
    get '/lessons/:id' do
        redirect_if_not_logged_in
        redirect_if_not_authorized
        erb :'lessons/show'
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
            redirect "/lessons/#{@lesson.id}"
        else
            redirect "/lessons/#{@lesson.id}/edit"
        end
    end

    delete "/lessons/:id" do
        redirect_if_not_logged_in
        redirect_if_not_authorized
        @lesson.destroy
        redirect "/lessons"
    end
end