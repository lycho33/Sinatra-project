class LessonsController < ApplicationController
    get '/lessons' do
        redirect_if_not_logged_in
        @lessons = current_user.lessons 
        erb :'/lessons/index'
    end

    get '/lessons/new' do
        redirect_if_not_logged_in
        erb :'lessons/new'
    end

    #Create new lesson (save in db)
    post '/lessons/new' do
        redirect_if_not_logged_in
        # lesson = current_user.lessons.build(params[:lessons])
        lesson = Lesson.new(title: params["lessons"]["title"], topic: params["lessons"]["topic"], content: params["lessons"]["content"], user_id: current_user.id)
        if lesson.save
            redirect "/lessons"
        else
            flash[:error] = "#{lesson.errors.full_messages.join(", ")}"
            redirect '/lessons/new'
        end
    end

      #Update 1 lesson
    get '/lessons/:id/edit' do
        redirect_if_not_logged_in
        redirect_if_not_authorized
        erb :'lessons/edit'
    end

    #Read 1 lesson
    get '/lessons/:id' do
        redirect_if_not_logged_in
        redirect_if_not_authorized
        erb :'lessons/show'
    end

    patch '/lessons/:id' do
        redirect_if_not_logged_in
        redirect_if_not_authorized
        @lesson = Lesson.find_by_id(params[:id])  
        if @lesson.update(params[:lessons])
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
    
    private 
    def redirect_if_not_authorized     
        @lesson = Lesson.find_by_id(params[:id])   
        if @lesson.user_id != session["user_id"]            
            redirect "/lessons"        
        end    
    end
end

